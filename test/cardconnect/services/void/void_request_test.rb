require 'test_helper'

describe CardConnect::Service::VoidRequest do
  before do
    @request = CardConnect::Service::VoidRequest.new(valid_void_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      _(@request.merchid).must_equal '000000927996'
    end

    it 'should have retrieval reference number' do
      _(@request.retref).must_equal '288013185633'
    end

    it 'should have amount' do
      _(@request.amount).must_equal '101'
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      _(CardConnect::Service::VoidRequest.new.valid?).must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      _(CardConnect::Service::VoidRequest.new(valid_void_request).valid?).must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::VoidRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        _(CardConnect::Service::VoidRequest.new.errors).must_include "#{field.to_s.capitalize} is missing"
      end
    end
  end

  describe '#payload' do
    it 'should generate hash with all the right values' do
      _(@request.payload).must_equal symbolize_keys(valid_void_request)
    end
  end
end
