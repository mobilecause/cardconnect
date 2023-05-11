require 'test_helper'

describe CardConnect::Service::ProfileGetResponse do
  before do
    @response = CardConnect::Service::ProfileGetResponse.new(valid_profile_get_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have profile id' do
      _(@response.profileid).must_equal '12345678901234567890'
    end

    it 'should have account id' do
      _(@response.acctid).must_equal '1'
    end

    it 'should have response status' do
      _(@response.respstat).must_equal 'B'
    end

    it 'should have account' do
      _(@response.account).must_equal '41XXXXXXXXXX1111'
    end

    it 'should have response code' do
      _(@response.respcode).must_equal 'A'
    end

    it 'should have response text' do
      _(@response.resptext).must_equal 'Profile found'
    end

    it 'should have respproc' do
      _(@response.respproc).must_equal 'PPS'
    end

    it 'should have accttype' do
      _(@response.accttype).must_equal 'VISA'
    end

    it 'should have expiry' do
      _(@response.expiry).must_equal '0214'
    end

    it 'should have name' do
      _(@response.name).must_equal 'TOM JONES'
    end

    it 'should have address' do
      _(@response.address).must_equal '123 MAIN STREET'
    end

    it 'should have city' do
      _(@response.city).must_equal 'ANYTOWN'
    end

    it 'should have region' do
      _(@response.region).must_equal 'AK'
    end

    it 'should have country' do
      _(@response.country).must_equal 'US'
    end

    it 'should have phone' do
      _(@response.phone).must_equal '7778789999'
    end

    it 'should have postal' do
      _(@response.postal).must_equal '19090'
    end

    it 'should have ssnl4' do
      _(@response.ssnl4).must_equal '1234'
    end

    it 'should have email' do
      _(@response.email).must_equal 'test@test.com'
    end

    it 'should have defaultacct' do
      _(@response.defaultacct).must_equal '12345'
    end

    it 'should have license' do
      _(@response.license).must_equal '123451254'
    end

    it 'should have token' do
      _(@response.token).must_equal '9440670166031111'
    end

    it 'should have gsacard' do
      _(@response.gsacard).must_equal 'N'
    end

    it 'should have auoptout' do
      _(@response.auoptout).must_equal 'N'
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      _(@response.success?).must_equal true
    end

    it 'should be false when there are errors' do
      prof_response = valid_profile_get_response.merge!('respstat' => 'C', 'resptext' => 'this is an error')
      response = CardConnect::Service::ProfileGetResponse.new(prof_response)
      _(response.success?).must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      _(@response.errors).must_be_empty
    end

    it 'should be an array of error messages when there are errors' do
      prof_response = valid_profile_get_response.merge!('respstat' => 'C', 'resptext' => 'this is an error')
      response = CardConnect::Service::ProfileGetResponse.new(prof_response)
      _(response.errors).must_equal ['this is an error']
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      _(@response.body).must_equal symbolize_keys(valid_profile_get_response)
    end
  end
end
