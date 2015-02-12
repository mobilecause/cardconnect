require 'test_helper'

describe CardConnect::Service::Inquire do
  before do
    @connection = CardConnect::Connection.new.connection do |stubs|
      path = @service.path + "/#{valid_inquire_request['retref']}/#{valid_inquire_request['merchid']}"
      stubs.get(path) { [200, {}, valid_inquire_response] }
    end
    @service = CardConnect::Service::Inquire.new(@connection)
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    @service.path.must_equal '/cardconnect/rest/inquire'
  end

  describe '#build_request' do
    before do
      @valid_params = valid_inquire_request
    end

    after do
      @valid_params = nil
    end

    it 'creates a Capture request object with the passed in params' do
      @service.build_request(@valid_params)

      @service.request.must_be_kind_of CardConnect::Service::InquireRequest
      @service.request.retref.must_equal "288002073633"
      @service.request.merchid.must_equal "000000927996"
    end

    it 'uses default merchant ID if merchid is not passed in' do
      @service.build_request(@valid_params.reject!{|k,v| k == 'merchid' })
      @service.request.must_be_kind_of CardConnect::Service::InquireRequest
      @service.request.merchid.must_equal "merchant123"
    end
  end

  describe '#submit' do
    it 'raises an error when there is no request' do
      @service.request.nil?.must_equal true
      proc { @service.submit }.must_raise CardConnect::Error
    end

    it 'creates a response when a valid request is processed' do
      @service.build_request(valid_inquire_request)
      @service.submit
      @service.response.must_be_kind_of CardConnect::Service::InquireResponse
    end
  end
end
