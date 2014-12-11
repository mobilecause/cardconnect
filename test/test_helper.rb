require 'cardconnect'

require 'minitest/autorun'

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

def valid_auth_response
  {
      "respstat" => "A",
      "account" => "41XXXXXXXXXX1111",
      "token" => "9419786452781111",
      "retref" => "343005123105",
      "amount" => "111",
      "merchid" => "020594000000",
      "respcode" => "00",
      "resptext" => "Approved",
      "avsresp" => "9",
      "cvvresp" => "M",
      "authcode" => "046221",
      "respproc" => "FNOR"
  }
end

def valid_auth_request
  {
      "merchid" => "000000927996",
      "accttype" => "VISA",
      "orderid" => "AB-11-9876",
      "account" => "4111111111111111",
      "expiry" => "1212",
      "amount" => "0",
      "currency" => "USD",
      "name" => "TOM JONES",
      "address" => "123 MAIN STREET",
      "city" => "anytown",
      "region" => "NY",
      "country" => "US",
      "postal" => "55555",
      "ecomind" => "E",
      "cvv2" => "123",
      "track" => nil,
      "tokenize" => "Y"
  }
end