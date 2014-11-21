module CardConnect
  module Service
    class Authorization

      def initialize
        @resource_name = '/auth'
        @config = CardConnect.configuration
      end

      def path
        Service.base_api_path + @resource_name
      end

      def payload
        {
          "merchid" => @config.merchant_id,
          "accttype" => "VISA",
          "orderid" => "123456",
          "account" => "4111111111111111",
          "expiry" => "1214",
          "amount" => "17.00",
          "currency" => "USD",
          "name" => "T Money",
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

      def request

        conn = Faraday.new(:url => 'https://fts.prinpay.com:6443')

        conn.basic_auth(@config.api_username, @config.api_password)

        res = conn.put path do |request|
          request.headers['Content-Type'] = 'application/json'
          request.body = JSON.generate(payload)
        end

        res
      end
    end
  end
end
