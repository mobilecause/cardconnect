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
      _(@response.country).must_equal 'USA'
    end

    it 'should have product' do
      _(@response.product).must_equal 'V'
    end

    it 'should have cardusestring' do
      _(@response.cardusestring).must_equal 'True credit'
    end

    it 'should have gsa' do
      _(@response.gsa).must_equal false
    end

    it 'should have corporate' do
      _(@response.corporate).must_equal true
    end

    it 'should have fsa' do
      _(@response.fsa).must_equal false
    end

    it 'should have subtype' do
      _(@response.subtype).must_equal 'Visa Corporate T&E'
    end

    it 'should have purchase' do
      _(@response.purchase).must_equal false
    end

    it 'should have prepaid' do
      _(@response.prepaid).must_equal false
    end

    it 'should have binlo' do
      _(@response.binlo).must_equal '478823XXX'
    end

    it 'should have issuer' do
      _(@response.issuer).must_equal "JPMorgan Chase Bank N.A. - Commercial"
    end

    it 'should have binhi' do
      _(@response.binhi).must_equal "478825XXX"
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      _(@response.body).must_equal symbolize_keys(valid_bin_response)
    end
  end
end
