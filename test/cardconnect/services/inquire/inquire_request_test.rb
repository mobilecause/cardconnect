require 'test_helper'

describe InquireRequest do
  before do
    @request = InquireRequest.new(valid_inquire_request)
    @valid_payload = symbolize_keys(valid_inquire_request)
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
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      InquireRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      InquireRequest.new(valid_inquire_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    InquireRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        InquireRequest.new.errors.must_include "#{field} is missing"
      end
    end
  end

  describe "#payload" do
    it 'should generate the correct path params' do
      @request.payload.must_equal '/288002073633/000000927996'
    end
  end
end
