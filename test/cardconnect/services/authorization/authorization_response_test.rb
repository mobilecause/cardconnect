require 'test_helper'

describe CardConnect::Service::AuthorizationResponse do
  before do
    @response = CardConnect::Service::AuthorizationResponse.new(valid_auth_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the merchant id' do
      @response.merchid.must_equal "020594000000"
    end

    it 'should have the status' do
      @response.respstat.must_equal "A"
    end

    it 'should have the Retrieval Reference Number' do
      @response.retref.must_equal "343005123105"
    end

    it 'should have the Account Number' do
      @response.account.must_equal "41XXXXXXXXXX1111"
    end

    it 'should have the Token' do
      @response.token.must_equal "9419786452781111"
    end

    it 'should have the Amount' do
      @response.amount.must_equal "111"
    end

    it 'should have the Response Code' do
      @response.respcode.must_equal "00"
    end

    it 'should have the Response text' do
      @response.resptext.must_equal "Approved"
    end

    it 'should have the Response Processor' do
      @response.respproc.must_equal "FNOR"
    end

    it 'should have the AVS response code' do
      @response.avsresp.must_equal "9"
    end

    it 'should have the CVV response code' do
      @response.cvvresp.must_equal "M"
    end

    it 'should have the Authorization code' do
      @response.authcode.must_equal "046221"
    end

    it 'should have the Commercial Card Flag' do
      @response.commcard.must_equal "N"
    end

    it 'should have the profile id' do
      @response.profileid.must_equal "12345678"
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      @response.success?.must_equal true
    end

    it 'should be false when there are errors' do
      response = CardConnect::Service::AuthorizationResponse.new(valid_auth_response.merge!("respstat" => "B", "resptext" => "this is an error"))
      response.success?.must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      @response.errors.must_be_empty
    end

    it 'should be an array of error messages when there are errors' do
      response = CardConnect::Service::AuthorizationResponse.new(valid_auth_response.merge!("respstat" => "B", "resptext" => "this is an error"))
      response.errors.must_equal ["this is an error"]
    end
  end

  describe "#body" do
    it 'should generate hash with all the right values' do
      @response.body.must_equal symbolize_keys(valid_auth_response)
    end
  end
end
