require 'test_helper'

describe CardConnect::Service::VoidResponse do
  before do
    @response = CardConnect::Service::VoidResponse.new(valid_void_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the merchant id' do
      _(@response.merchid).must_equal '000000927996'
    end

    it 'should have the Amount' do
      _(@response.amount).must_equal '1.01'
    end

    it 'should have the currency' do
      _(@response.currency).must_equal 'USD'
    end

    it 'should have the Retrieval Reference Number' do
      _(@response.retref).must_equal '288013185633'
    end

    it 'should have the authcode' do
      _(@response.authcode).must_equal 'REVERS'
    end

    it 'should have the Response Code' do
      _(@response.respcode).must_equal '00'
    end

    it 'should have the Response Processor' do
      _(@response.respproc).must_equal 'FNOR'
    end

    it 'should have the status' do
      _(@response.respstat).must_equal 'A'
    end

    it 'should have the Response text' do
      _(@response.resptext).must_equal 'Approval'
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      _(@response.success?).must_equal true
    end

    it 'should be false when there are errors' do
      void_response = valid_void_response.merge!('respstat' => 'C', 'resptext' => 'this is an error')
      response = CardConnect::Service::VoidResponse.new(void_response)
      _(response.success?).must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      _(@response.errors).must_be_empty
    end

    it 'should be an array of error messages when there are errors' do
      void_response = valid_void_response.merge!('respstat' => 'C', 'resptext' => 'this is an error')
      response = CardConnect::Service::VoidResponse.new(void_response)
      _(response.errors).must_equal ['this is an error']
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      _(@response.body).must_equal symbolize_keys(valid_void_response)
    end
  end
end
