require 'test_helper'

describe CardConnect::Service::BinResponse do
  before do
    @response = CardConnect::Service::BinResponse.new(valid_bin_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have country' do
      @response.country.must_equal 'USA'
    end

    it 'should have product' do
      @response.product.must_equal 'V'
    end

    it 'should have cardusestring' do
      @response.cardusestring.must_equal 'True credit'
    end

    it 'should have gsa' do
      @response.gsa.must_equal false
    end

    it 'should have corporate' do
      @response.corporate.must_equal true
    end

    it 'should have fsa' do
      @response.fsa.must_equal false
    end

    it 'should have subtype' do
      @response.subtype.must_equal 'Visa Corporate T&E'
    end

    it 'should have purchase' do
      @response.purchase.must_equal false
    end

    it 'should have prepaid' do
      @response.prepaid.must_equal false
    end

    it 'should have binlo' do
      @response.binlo.must_equal '478823XXX'
    end

    it 'should have issuer' do
      @response.issuer.must_equal "JPMorgan Chase Bank N.A. - Commercial"
    end

    it 'should have binhi' do
      @response.binhi.must_equal "478825XXX"
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      @response.body.must_equal symbolize_keys(valid_bin_response)
    end
  end
end
