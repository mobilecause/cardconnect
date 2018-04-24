require 'test_helper'

describe CardConnect::Service::BinRequest do
  before do
    @request = CardConnect::Service::BinRequest.new(valid_bin_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      @request.merchid.must_equal '000000927996'
    end

    it 'should have token' do
      @request.token.must_equal '9477709629051443'
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      CardConnect::Service::BinRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      CardConnect::Service::BinRequest.new(valid_bin_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::BinRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        CardConnect::Service::BinRequest.new.errors.must_include "#{field.to_s.capitalize} is missing"
      end
    end
  end

  describe '#payload' do
    it 'should generate the correct path params' do
      @request.payload.must_equal '/000000927996/9477709629051443'
    end
  end
end
