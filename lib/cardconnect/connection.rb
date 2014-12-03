require 'faraday'
require 'faraday_middleware'

module CardConnect
  class Connection
    def initialize
      @config = CardConnect.configuration
      @headers = {user_agent: "CardConnectRubyGem/#{CardConnect::VERSION}"}
    end

    def connection
      @connection ||= begin
        Faraday.new(url: @config.endpoint, headers: @headers) do |faraday|
          faraday.request :basic_auth, @config.api_username, @config.api_password
          faraday.request :json

          faraday.response :json, :content_type => /\bjson$/

          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end