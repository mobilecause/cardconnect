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

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      CaptureRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      CaptureRequest.new(valid_capture_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    CaptureRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        CaptureRequest.new.errors.must_include "#{field} is missing"
      end
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
