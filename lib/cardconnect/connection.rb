require 'faraday'

module CardConnect
  class Connection
    def initialize(config = CardConnect.configuration)
      @config = config
    end

    def connection(config = nil)
      config ||= @config
      @connection ||= Faraday.new(faraday_options) do |f|
        f.request :authorization, :basic, config.api_username, config.api_password
        f.request :json

        f.response :json, content_type: /\bjson$/
        f.response :raise_error

        f.adapter Faraday.default_adapter
      end
    end

    def ping_server
      connection.get('/cardconnect/rest/')
    rescue Faraday::ResourceNotFound => e
      return e
    rescue Faraday::ClientError => e
      return e
    end

    def faraday_options
      {
        url: @config.endpoint,
        headers: {
          user_agent: "CardConnectRubyGem/#{CardConnect::VERSION}"
        },
      }.merge(@config.connection_options)
    end
  end
end
