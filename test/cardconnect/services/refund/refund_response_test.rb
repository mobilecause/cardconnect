require 'test_helper'

describe CardConnect::Service::RefundResponse do
  before do
    @response = CardConnect::Service::RefundResponse.new(valid_refund_response)
    @valid_payload = symbolize_keys(valid_refund_response)
  end

  after do
    @response = nil
    @valid_payload = nil
  end

  describe 'FIELDS' do
    it 'should have the merchant id' do
      @response.merchid.must_equal @valid_payload[:merchid]
    end

    it 'should have the Amount' do
      @response.amount.must_equal @valid_payload[:amount]
    end

    it 'should have the Retrieval Reference Number' do
      @response.retref.must_equal @valid_payload[:retref]
    end

    it 'should have the Response Code' do
      @response.respcode.must_equal @valid_payload[:respcode]
    end

    it 'should have the Response Processor' do
      @response.respproc.must_equal @valid_payload[:respproc]
    end

    it 'should have the status' do
      @response.respstat.must_equal @valid_payload[:respstat]
    end

    it 'should have the Response text' do
      @response.resptext.must_equal @valid_payload[:resptext]
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      @response.success?.must_equal true
    end

    it 'should be false when there are errors' do
      response = CardConnect::Service::RefundResponse.new(valid_refund_response.merge!("respstat" => "C", "resptext" => "this is an error"))
      response.success?.must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      @response.errors.must_be_empty
    end

    it 'should be an array of error messages when there are errors' do
      response = CardConnect::Service::RefundResponse.new(valid_refund_response.merge!("respstat" => "C", "resptext" => "this is an error"))
      response.errors.must_equal ["this is an error"]
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