require 'test_helper'

describe CardConnect::Service::CaptureResponse do
  before do
    @response = CardConnect::Service::CaptureResponse.new(valid_capture_response)
    @valid_payload = symbolize_keys(valid_capture_response)
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

    it 'should have retrieval reference number' do
      @response.retref.must_equal @valid_payload[:retref]
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