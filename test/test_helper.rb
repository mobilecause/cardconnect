require 'cardconnect'

require 'minitest/autorun'

require 'request_stubs'
require 'response_stubs'

include CardConnect

CardConnect.configure do |config|
  config.merchant_id = "merchant123"
  config.api_username = "test"
  config.api_password = "testpass"
  config.endpoint = "https://test.host"
end

# Stub out the Faraday connection for testing.
class Connection
  def connection
    @connection ||= Faraday.new(url: @config.endpoint, headers: @headers) do |faraday|
      faraday.request :basic_auth, @config.api_username, @config.api_password
      faraday.request :json

      faraday.response :json, :content_type => /\bjson$/
      faraday.response :raise_error

      faraday.adapter :test do |stubs|
        yield(stubs)
      end
    end
  end
end
