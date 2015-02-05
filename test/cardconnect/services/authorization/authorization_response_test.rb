require 'test_helper'

describe AuthorizationResponse do
  before do
    @response = AuthorizationResponse.new(valid_auth_response)
    @valid_payload = symbolize_keys(valid_auth_response)
  end

  after do
    @response = nil
    @valid_payload = nil
  end

  describe 'FIELDS' do
    it 'should have the merchant id' do
      @response.merchid.must_equal @valid_payload[:merchid]
    end

    it 'should have the status' do
      @response.respstat.must_equal @valid_payload[:respstat]
    end

    it 'should have the Retrieval Reference Number' do
      @response.retref.must_equal @valid_payload[:retref]
    end

    it 'should have the Account Number' do
      @response.account.must_equal @valid_payload[:account]
    end

    it 'should have the Token' do
      @response.token.must_equal @valid_payload[:token]
    end

    it 'should have the Amount' do
      @response.amount.must_equal @valid_payload[:amount]
    end

    it 'should have the Response Code' do
      @response.respcode.must_equal @valid_payload[:respcode]
    end

    it 'should have the Response text' do
      @response.resptext.must_equal @valid_payload[:resptext]
    end

    it 'should have the Response Processor' do
      @response.respproc.must_equal @valid_payload[:respproc]
    end

    it 'should have the AVS response code' do
      @response.avsresp.must_equal @valid_payload[:avsresp]
    end

    it 'should have the CVV response code' do
      @response.cvvresp.must_equal @valid_payload[:cvvresp]
    end

    it 'should have the Authorization code' do
      @response.authcode.must_equal @valid_payload[:authcode]
    end

    it 'should have the Commercial Card Flag' do
      @response.commcard.must_equal @valid_payload[:commcard]
    end
  end

  describe "#body" do
    it 'should generate hash with all the right values' do
      @response.body.keys.each do |k|
        @response.body[k].must_equal @valid_payload[k]
      end
    end
  end
end