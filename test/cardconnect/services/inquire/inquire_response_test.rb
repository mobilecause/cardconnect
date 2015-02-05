require 'test_helper'

describe InquireResponse do
  before do
    @response = InquireResponse.new(valid_inquire_response)
    @valid_payload = symbolize_keys(valid_inquire_response)
  end

  after do
    @response = nil
    @valid_payload = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      @response.merchid.must_equal @valid_payload[:merchid]
    end

    it 'should have account' do
      @response.account.must_equal @valid_payload[:account]
    end

    it 'should have amount' do
      @response.amount.must_equal @valid_payload[:amount]
    end

    it 'should have currency' do
      @response.currency.must_equal @valid_payload[:currency]
    end

    it 'should have retrieval reference number' do
      @response.retref.must_equal @valid_payload[:retref]
    end

    it 'should have response code' do
      @response.respcode.must_equal @valid_payload[:respcode]
    end

    it 'should have response processor' do
      @response.respproc.must_equal @valid_payload[:respproc]
    end

    it 'should have response status' do
      @response.respstat.must_equal @valid_payload[:respstat]
    end

    it 'should have capture status' do
      @response.resptext.must_equal @valid_payload[:resptext]
    end

    it 'should have settlement status' do
      @response.setlstat.must_equal @valid_payload[:setlstat]
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