require 'test_helper'

describe CaptureRequest do
  before do
    @request = CaptureRequest.new(valid_capture_request)
    @valid_payload = symbolize_keys(valid_capture_request)
  end

  after do
    @request = nil
    @valid_payload = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      @request.merchid.must_equal @valid_payload[:merchid]
    end

    it 'should have retrieval reference number' do
      @request.retref.must_equal @valid_payload[:retref]
    end

    it 'should have authorization code' do
      @request.authcode.must_equal @valid_payload[:authcode]
    end

    it 'should have amount' do
      @request.amount.must_equal @valid_payload[:amount]
    end

    it 'should have invoice id' do
      @request.invoiceid.must_equal @valid_payload[:invoiceid]
    end
  end

  describe "#payload" do
    it 'should generate hash with all the right values' do
      @request.payload.keys.each do |k|
        @request.payload[k].must_equal @valid_payload[k]
      end
    end
  end
end
