require 'test_helper'

describe AuthorizationRequest do
  before do
    @request = AuthorizationRequest.new
  end

  after do
    @request = nil
  end

  describe "#valid?" do
    before do
      @request.merchid = '123'
      @request.account = '4111111111111111'
      @request.expiry = '122015'
      @request.amount = '40.00'
      @request.currency = 'USD'
    end

    it 'should be true all required fields have a value' do
      @request.valid?.must_equal true
    end

    it 'should be false and have error message if merchid is missing' do
      @request.merchid = nil
      @request.valid?.must_equal false
      @request.errors.must_include "merchid cannot be blank"
    end

    it 'should be false and have error message if account is missing' do
      @request.account = nil
      @request.valid?.must_equal false
      @request.errors.must_include "account cannot be blank"
    end

    it 'should be false and have error message if expiry is missing' do
      @request.expiry = nil
      @request.valid?.must_equal false
      @request.errors.must_include "expiry cannot be blank"
    end

    it 'should be false and have error message if amount is missing' do
      @request.amount = nil
      @request.valid?.must_equal false
      @request.errors.must_include "amount cannot be blank"
    end

    it 'should be false and have error message if currency is missing' do
      @request.currency = nil
      @request.valid?.must_equal false
      @request.errors.must_include "currency cannot be blank"
    end
  end

  describe "#payload" do
    def valid_params
      {
          merchid: "123",
          account: "4111111111111111",
          expiry: "122015",
          amount: "40.00",
          currency: "USD",
          accttype: nil,
          name: "Bob Denver",
          address: "123 Fake St.",
          city: "Anytown",
          region: "MA",
          country: "USA",
          phone: "9993334444",
          postal: nil,
          email: "bob@example.com",
          ecomind: nil,
          cvv2: nil,
          orderid: nil,
          track: nil,
          bankaba: nil,
          tokenize: nil,
          termid: nil,
          capture: nil
      }
    end

    before do
      @request = AuthorizationRequest.new(valid_params)
    end

    it 'should generate JSON with all the right values' do
      @request.payload.must_equal valid_params
    end
  end
end
