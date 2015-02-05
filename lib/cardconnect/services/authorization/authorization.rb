module CardConnect
  module Service
    class Authorization
      include Utils

      attr_reader :request, :response

      # Initializes an Authorization Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Authorization
      def initialize(connection = CardConnect.connection)
        @resource_name = '/auth'
        @config = CardConnect.configuration
        @connection = connection
        @errors = []
      end

      def path
        Service.base_api_path + @resource_name
      end

      def build_request(params = {})
        req = symbolize_keys(params)
        req = req.merge(merchid: @config.merchant_id) unless req.has_key?(:merchid)
        @request = AuthorizationRequest.new(req)
      end

      def submit
        raise CardConnect::Error, "Request has not been built" if request.nil?
        @response = put(request.payload)
      end

      private

      def put(body = nil)
        begin
          AuthorizationResponse.new(@connection.put(path, body).body)
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end

    end
  end
end
