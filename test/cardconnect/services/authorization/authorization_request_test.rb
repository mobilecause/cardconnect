require 'test_helper'

describe CardConnect::Service::AuthorizationRequest do
  before do
    @request = CardConnect::Service::AuthorizationRequest.new(valid_auth_request)
    @valid_payload = symbolize_keys(valid_auth_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      @request.merchid.must_equal @valid_payload[:merchid]
    end

    it 'should have account' do
      @request.account.must_equal @valid_payload[:account]
    end

    it 'should have expiry' do
      @request.expiry.must_equal @valid_payload[:expiry]
    end

    it 'should have amount' do
      @request.amount.must_equal @valid_payload[:amount]
    end

    it 'should have currency' do
      @request.currency.must_equal @valid_payload[:currency]
    end

    it 'should have account type' do
      @request.accttype.must_equal @valid_payload[:accttype]
    end

    it 'should have name' do
      @request.name.must_equal @valid_payload[:name]
    end

    it 'should have address' do
      @request.address.must_equal @valid_payload[:address]
    end

    it 'should have city' do
      @request.city.must_equal @valid_payload[:city]
    end

    it 'should have country' do
      @request.country.must_equal @valid_payload[:country]
    end

    it 'should have phone' do
      @request.phone.must_equal @valid_payload[:phone]
    end

    it 'should have postal' do
      @request.postal.must_equal @valid_payload[:postal]
    end

    it 'should have email' do
      @request.email.must_equal @valid_payload[:email]
    end

    it 'should have ecomind' do
      @request.ecomind.must_equal @valid_payload[:ecomind]
    end

    it 'should have cvv2' do
      @request.cvv2.must_equal @valid_payload[:cvv2]
    end

    it 'should have order id' do
      @request.orderid.must_equal @valid_payload[:orderid]
    end

    it 'should have track' do
      @request.track.must_equal @valid_payload[:track]
    end

    it 'should have bankaba' do
      @request.bankaba.must_equal @valid_payload[:bankaba]
    end

    it 'should have tokenize' do
      @request.tokenize.must_equal @valid_payload[:tokenize]
    end

    it 'should have termid' do
      @request.termid.must_equal @valid_payload[:termid]
    end

    it 'should have capture' do
      @request.capture.must_equal @valid_payload[:capture]
    end

    it 'should have ssnl4 field' do
      @request.ssnl4.must_equal @valid_payload[:ssnl4]
    end

    it 'should have license field' do
      @request.license.must_equal @valid_payload[:license]
    end

    it 'should have profile field' do
      @request.profile.must_equal @valid_payload[:profile]
    end

    describe "userfields" do
      it 'should be an array of name-value pairs' do
        @request.userfields.must_be_kind_of Array
        @request.userfields.first.must_be_kind_of Hash
        @request.userfields.first['name0'].must_equal 'value0'
      end
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      CardConnect::Service::AuthorizationRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      CardConnect::Service::AuthorizationRequest.new(valid_auth_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::AuthorizationRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        CardConnect::Service::AuthorizationRequest.new.errors.must_include "#{field.to_s.capitalize} is missing"
      end
    end
  end

  describe '#payload' do
    it 'should generate hash with all the right values' do
      @request.payload.keys.each do |k|
        @request.payload[k].must_equal @valid_payload[k]
      end
    end
  end
end
