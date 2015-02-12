require 'test_helper'

describe CardConnect::Service::Authorization do
  before do
    @connection = CardConnect::Connection.new.connection do |stubs|
      stubs.put(@service.path) { [200, {}, valid_auth_response] }
    end
    @service = CardConnect::Service::Authorization.new(@connection)
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    @service.path.must_equal '/cardconnect/rest/auth'
  end

  describe '#build_request' do
    before do
      @valid_params = valid_auth_request
    end

    after do
      @valid_params = nil
    end

    it 'uses the default merchant id if it is not passed in' do
      @service.build_request(@valid_params.reject!{|k,v| k == 'merchid' })
      @service.request.merchid.must_equal 'merchant123'
    end

    it 'creates an Authorization request object with the right params' do
      @service.build_request(@valid_params)

      @service.request.must_be_kind_of CardConnect::Service::AuthorizationRequest

      @service.request.merchid.must_equal '000000927996'
      @service.request.account.must_equal '4111111111111111'
      @service.request.expiry.must_equal '1212'
      @service.request.amount.must_equal '0'
      @service.request.currency.must_equal 'USD'
    end
  end

  describe '#submit' do
    it 'raises an error when there is no request' do
      @service.request.nil?.must_equal true
      proc { @service.submit }.must_raise CardConnect::Error
    end

    it 'creates a response when a valid request is processed' do
      @service.build_request(valid_auth_request)
      @service.submit
      @service.response.must_be_kind_of CardConnect::Service::AuthorizationResponse
    end
  end

end
