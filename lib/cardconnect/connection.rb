require 'faraday'
require 'faraday_middleware'

module CardConnect
  class Connection

    def initialize
      @config = CardConnect.configuration
      @headers = {user_agent: "CardConnectRubyGem/#{CardConnect::VERSION}"}
    end

    def connection
      @connection ||= Faraday.new(url: @config.endpoint, headers: @headers, ssl: {verify: false}) do |faraday|
        faraday.request :basic_auth, @config.api_username, @config.api_password
        faraday.request :json

        faraday.response :json, :content_type => /\bjson$/
        faraday.response :raise_error

        faraday.adapter Faraday.default_adapter
      end
    end

    def ping_server
      begin
        connection.get('/cardconnect/rest/')
      rescue Faraday::ResourceNotFound => e
        return e
      rescue Faraday::ClientError => e
        return e
      end
    end

  end
end
