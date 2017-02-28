require 'test_helper'

describe CardConnect::Service::InquireRequest do
  before do
    @request = CardConnect::Service::InquireRequest.new(valid_inquire_request)
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
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      CardConnect::Service::InquireRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      CardConnect::Service::InquireRequest.new(valid_inquire_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::InquireRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        CardConnect::Service::InquireRequest.new.errors.must_include "#{field.to_s.capitalize} is missing"
      end
    end
  end

  describe '#payload' do
    it 'should generate the correct path params' do
      @request.payload.must_equal '/288002073633/000000927996'
    end
  end
end
