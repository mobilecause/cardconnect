require 'test_helper'

describe CardConnect::Service::ProfilePutResponse do
  before do
    @response = CardConnect::Service::ProfilePutResponse.new(valid_profile_put_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have profile id' do
      @response.profileid.must_equal '12305454023615201322'
    end

    it 'should have account id' do
      @response.acctid.must_equal '1'
    end

    it 'should have response status' do
      @response.respstat.must_equal 'A'
    end

    it 'should have account' do
      @response.account.must_equal '41XXXXXXXXXX1111'
    end

    it 'should have response code' do
      @response.respcode.must_equal '09'
    end

    it 'should have response text' do
      @response.resptext.must_equal 'Profile Saved'
    end

    it 'should have respproc' do
      @response.respproc.must_equal 'PPS'
    end

    it 'should have accttype' do
      @response.accttype.must_equal 'VISA'
    end

    it 'should have expiry' do
      @response.expiry.must_equal '0214'
    end

    it 'should have name' do
      @response.name.must_equal 'TOM JONES'
    end

    it 'should have address' do
      @response.address.must_equal '123 MAIN STREET'
    end

    it 'should have city' do
      @response.city.must_equal 'ANYTOWN'
    end

    it 'should have region' do
      @response.region.must_equal 'AK'
    end

    it 'should have country' do
      @response.country.must_equal 'US'
    end

    it 'should have phone' do
      @response.phone.must_equal '7778789999'
    end

    it 'should have postal' do
      @response.postal.must_equal '19090'
    end

    it 'should have ssnl4' do
      @response.ssnl4.must_equal '3655'
    end

    it 'should have email' do
      @response.email.must_equal 'test@test.com'
    end

    it 'should have defaultacct' do
      @response.defaultacct.must_equal 'Y'
    end

    it 'should have license' do
      @response.license.must_equal '123451254'
    end

    it 'should have token' do
      @response.token.must_equal '9441149619831111'
    end

    it 'should have gsacard' do
      @response.gsacard.must_equal 'N'
    end

    it 'should have auoptout' do
      @response.auoptout.must_equal 'N'
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      @response.success?.must_equal true
    end

    it 'should be false when there are errors' do
      prof_response = valid_profile_put_response.merge!('respstat' => 'C', 'resptext' => 'this is an error')
      response = CardConnect::Service::ProfilePutResponse.new(prof_response)
      response.success?.must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      @response.errors.must_be_empty
    end

    it 'should be an array of error messages when there are errors' do
      prof_response = valid_profile_put_response.merge!('respstat' => 'C', 'resptext' => 'this is an error')
      response = CardConnect::Service::ProfilePutResponse.new(prof_response)
      response.errors.must_equal ['this is an error']
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      @response.body.must_equal symbolize_keys(valid_profile_put_response)
    end
  end
end
