require 'test_helper'

describe CardConnect::Service::DepositRequest do
  before do
    @request = CardConnect::Service::DepositRequest.new(valid_deposit_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      @request.merchid.must_equal '000000927996'
    end

    it 'should have date' do
      @request.date.must_equal '0110'
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      CardConnect::Service::DepositRequest.new.valid?.must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      CardConnect::Service::DepositRequest.new(valid_deposit_request).valid?.must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::DepositRequest::REQUIRED_FIELDS.each do |field|
      it "should have an error message if #{field} is missing" do
        CardConnect::Service::DepositRequest.new.errors.must_include "#{field.to_s.capitalize} is missing"
      end
    end

    describe '#validate_date_format' do
      it 'should have an error when date is less than 4 characters long' do
        request = CardConnect::Service::DepositRequest.new(date: '123')
        request.valid?.must_equal false
        request.errors.must_include 'Date format is invalid. Please use MMDD format'
      end

      it 'should have an error when date is more than 4 characters long' do
        request = CardConnect::Service::DepositRequest.new(date: '12345')
        request.valid?.must_equal false
        request.errors.must_include 'Date format is invalid. Please use MMDD format'
      end

      it 'should have an error when date is not parseable in MMDD format' do
        request = CardConnect::Service::DepositRequest.new(date: '0000')
        request.valid?.must_equal false
        request.errors.must_include 'Date format is invalid. Please use MMDD format'
      end
    end
  end

  describe '#payload' do
    it 'should generate the correct path params' do
      @request.payload.must_equal "?merchid=#{@request.merchid}&date=#{@request.date}&"
    end
  end
end
