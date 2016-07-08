require 'test_helper'

describe CardConnect::Service::CaptureRequest do
  before do
    @request = CardConnect::Service::CaptureRequest.new(valid_capture_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      @request.merchid.must_equal '000000927996'
    end

    it 'should have retrieval reference number' do
      @request.retref.must_equal '288002073633'
    end

    it 'should have authorization code' do
      @request.authcode.must_equal '046221'
    end

    it 'should have amount' do
      @request.amount.must_equal '596.00'
    end

    it 'should have invoice id' do
      @request.invoiceid.must_equal '7890'
    end

    it 'should have PO number' do
      @request.ponumber.must_equal 'PO-0736332'
    end

    it 'should have tax amount' do
      @request.taxamnt.must_equal '40.00'
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      CardConnect::Service::CaptureRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      CardConnect::Service::CaptureRequest.new(valid_capture_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::CaptureRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        CardConnect::Service::CaptureRequest.new.errors.must_include "#{field.to_s.capitalize} is missing"
      end
    end
  end

  describe '#payload' do
    it 'should generate hash with all the right values' do
      @request.payload.must_equal symbolize_keys(valid_capture_request)
    end
  end
end
