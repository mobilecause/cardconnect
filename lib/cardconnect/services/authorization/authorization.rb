module CardConnect
  module Service
    class Authorization
      include Utils

      attr_reader :request, :response

      def initialize
        @resource_name = '/auth'
        @config = CardConnect.configuration
        @connection = CardConnect.connection
        @errors = []
      end

      def path
        Service.base_api_path + @resource_name
      end

      def build_request(params = {})
        req = params.merge(merchid: @config.merchant_id)
        @request = AuthorizationRequest.new(symbolize_keys(req))
      end

      def submit_authorization
        @response = put(request.payload)
      end

      private

      def put(body = nil)
        begin
          response = @connection.put(path, body)
          AuthorizationResponse.new(symbolize_keys(response.body))
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end

    end
  end
end
