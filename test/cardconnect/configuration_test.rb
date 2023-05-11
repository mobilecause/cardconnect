require 'test_helper'

describe CardConnect::Configuration do
  before do
    @config = CardConnect::Configuration.new
  end

  after do
    @config = nil
  end

  it 'must respond to merchant id' do
    _(@config).must_respond_to :merchant_id
  end

  it 'must respond to api username' do
    _(@config).must_respond_to :api_username
  end

  it 'must respond to api password' do
    _(@config).must_respond_to :api_password
  end

  it 'must respond to endpoint' do
    _(@config).must_respond_to :endpoint
  end

  it 'must respond to connection_options' do
    _(@config).must_respond_to :connection_options
  end
end
