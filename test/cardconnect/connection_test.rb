require 'test_helper'

describe CardConnect::Connection do
  before do
    @connection = CardConnect::Connection.new.connection
  end

  after do
    @connection = nil
  end

  describe '#connection' do
    it 'must have user agent in the headers' do
      @connection.headers['User-Agent'].must_equal "CardConnectRubyGem/#{CardConnect::VERSION}"
    end

    it 'must have a URL that matches the configured endpoint' do
      @connection.url_prefix.host.must_equal URI.parse(CardConnect.configuration.endpoint).host
      @connection.url_prefix.scheme.must_equal 'https'
    end

    describe 'Faraday handlers' do
      it 'must have a handler for basic authentication first' do
        @connection.builder.handlers.first.must_be :===, Faraday::Request::BasicAuthentication
      end

      it 'must have a handler for encoding the request as json second' do
        @connection.builder.handlers[1].must_be :===, FaradayMiddleware::EncodeJson
      end

      it 'must have a handler for parsing the json response third' do
        @connection.builder.handlers[2].must_be :===, FaradayMiddleware::ParseJson
      end

      it 'has ssl verification on by default' do
        assert(@connection.ssl.verify?)
      end

      it 'has the ability to accept ssl options' do
        config = CardConnect.configuration.dup
        config.connection_options = { ssl: { verify: false } }
        connection = CardConnect::Connection.new(config).connection
        refute(connection.ssl.verify)
      end
    end
  end
end
