require 'test_helper'

describe Service::Authorization do
  before do
    @service = Service::Authorization.new
  end

  after do
    @service = nil
  end

  it 'must have the right path' do
    @service.path.must_equal '/cardconnect/rest/auth'
  end

  describe '#build_request' do
    before do
      @valid_params = {account: '4111111111111111', expiry: '122015', amount: '40.00', currency: 'USD'}
    end

    after do
      @valid_params = nil
    end

    it 'adds the merchant id to the params' do
      @service.build_request(@valid_params)
      @service.request.merchid.must_equal CardConnect.configuration.merchant_id
    end

    it 'creates and Authorization request object with the right params' do
      @service.build_request(@valid_params)

      @service.request.must_be_kind_of AuthorizationRequest

      @service.request.account.must_equal '4111111111111111'
      @service.request.expiry.must_equal '122015'
      @service.request.amount.must_equal '40.00'
      @service.request.currency.must_equal 'USD'
    end
  end
end
