require 'cardconnect'

require 'minitest/autorun'

include CardConnect

CardConnect.configure do |config|
  config.merchant_id = "merchant123"
  config.api_username = "test"
  config.api_password = "testpass"
  config.endpoint = "https://test.host"
end
