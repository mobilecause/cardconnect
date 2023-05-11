require 'test_helper'

describe CardConnect::Service::ProfilePutRequest do
  before do
    @request = CardConnect::Service::ProfilePutRequest.new(valid_profile_put_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      _(@request.merchid).must_equal '000000927996'
    end

    it 'should have profile id' do
      _(@request.profileid).must_equal '12345678901234567890'
    end

    it 'should have region' do
      _(@request.region).must_equal 'AK'
    end

    it 'should have phone' do
      _(@request.phone).must_equal '7778789999'
    end

    it 'should have accttype' do
      _(@request.accttype).must_equal 'VISA'
    end

    it 'should have postal' do
      _(@request.postal).must_equal '19090'
    end

    it 'should have ssnl4' do
      _(@request.ssnl4).must_equal '3655'
    end

    it 'should have expiry' do
      _(@request.expiry).must_equal '0214'
    end

    it 'should have city' do
      _(@request.city).must_equal 'ANYTOWN'
    end

    it 'should have country' do
      _(@request.country).must_equal 'US'
    end

    it 'should have address' do
      _(@request.address).must_equal '123 MAIN STREET'
    end

    it 'should have name' do
      _(@request.name).must_equal 'TOM JONES'
    end

    it 'should have account' do
      _(@request.account).must_equal '4444333322221111'
    end

    it 'should have license' do
      _(@request.license).must_equal '123451254'
    end

    it 'should have defaultacct' do
      _(@request.defaultacct).must_equal 'N'
    end

    it 'should have profileupdate' do
      _(@request.profileupdate).must_equal 'Y'
    end

    it 'should have profile' do
      _(@request.profile).must_equal '12345678901234567890acctid'
    end

    it 'should have bankaba' do
      _(@request.bankaba).must_equal '1234567'
    end

    it 'should have email' do
      _(@request.email).must_equal 'test@email.com'
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      _(CardConnect::Service::ProfilePutRequest.new.valid?).must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      _(CardConnect::Service::ProfilePutRequest.new(valid_profile_put_request).valid?).must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::ProfilePutRequest::REQUIRED_FIELDS.each do |field|
      field_name = field.to_s.capitalize
      it "should have an error message if #{field_name} is missing" do
        _(CardConnect::Service::ProfilePutRequest.new.errors).must_include "#{field_name} is missing"
      end
    end
  end

  describe '#payload' do
    it 'should generate hash with all the right values' do
      _(@request.payload).must_equal symbolize_keys(valid_profile_put_request)
    end
  end
end
