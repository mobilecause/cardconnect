require 'test_helper'

describe CardConnect::Service::Void do
  before do
    @connection = CardConnect::Connection.new.connection do |stubs|
      stubs.put(@service.path) { [200, {}, valid_void_response] }
    end
    @service = CardConnect::Service::Void.new(@connection)
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    _(@service.path).must_equal '/cardconnect/rest/void'
  end

  describe '#build_request' do
    before do
      @valid_params = valid_void_request
    end

    after do
      @valid_params = nil
    end

    it 'uses the default merchant id if it is not passed in' do
      @service.build_request(@valid_params.reject! { |k, _| k == 'merchid' })
      _(@service.request.merchid).must_equal 'merchant123'
    end

    it 'creates an Authorization request object with the right params' do
      @service.build_request(@valid_params)

      _(@service.request).must_be_kind_of CardConnect::Service::VoidRequest

      _(@service.request.merchid).must_equal '000000927996'
      _(@service.request.retref).must_equal '288013185633'
      _(@service.request.amount).must_equal '101'
    end
  end

  describe '#submit' do
    it 'raises an error when there is no request' do
      _(@service.request.nil?).must_equal true
      _{ @service.submit }.must_raise CardConnect::Error
    end

    it 'creates a response when a valid request is processed' do
      @service.build_request(valid_void_request)
      @service.submit
      _(@service.response).must_be_kind_of CardConnect::Service::VoidResponse
    end
  end
end
