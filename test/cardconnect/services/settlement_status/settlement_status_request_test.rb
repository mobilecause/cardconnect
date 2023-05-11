require 'test_helper'

describe CardConnect::Service::SettlementStatusRequest do
  before do
    @request = CardConnect::Service::SettlementStatusRequest.new(valid_settlestat_request)
  end

  after do
    @request = nil
  end

  describe 'FIELDS' do
    it 'should have merchant id' do
      _(@request.merchid).must_equal '000000927996'
    end

    it 'should have retrieval reference number' do
      _(@request.date).must_equal '0110'
    end
  end

  describe '#valid?' do
    it 'should not be valid if no attributes are passed in' do
      _(CardConnect::Service::SettlementStatusRequest.new.valid?).must_equal false
    end

    it 'should be valid if valid attributes are passed in' do
      _(CardConnect::Service::SettlementStatusRequest.new(valid_settlestat_request).valid?).must_equal true
    end
  end

  describe '#errors' do
    CardConnect::Service::SettlementStatusRequest::REQUIRED_FIELDS.each do |field|
      field_name = field.to_s.capitalize
      it "should have an error message if #{field_name} is missing" do
        _(CardConnect::Service::SettlementStatusRequest.new.errors).must_include "#{field_name} is missing"
      end
    end

    describe '#validate_date_format' do
      it 'should have an error when date is less than 4 characters long' do
        request = CardConnect::Service::SettlementStatusRequest.new(date: '123')
        _(request.valid?).must_equal false
        _(request.errors).must_include 'Date format is invalid. Please use MMDD format'
      end

      it 'should have an error when date is more than 4 characters long' do
        request = CardConnect::Service::SettlementStatusRequest.new(date: '12345')
        _(request.valid?).must_equal false
        _(request.errors).must_include 'Date format is invalid. Please use MMDD format'
      end

      it 'should have an error when date is not parseable in MMDD format' do
        request = CardConnect::Service::SettlementStatusRequest.new(date: '0000')
        _(request.valid?).must_equal false
        _(request.errors).must_include 'Date format is invalid. Please use MMDD format'
      end
    end
  end

  describe '#payload' do
    it 'should generate the correct path params' do
      _(@request.payload).must_equal "?merchid=#{@request.merchid}&date=#{@request.date}&"
    end
  end
end
