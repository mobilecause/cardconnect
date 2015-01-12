module CardConnect
  module Service
    class Capture
      attr_reader :request, :response

      def initialize
        @resource_name = '/capture'
        @config = CardConnect.configuration
        @connection = CardConnect.connection
        @errors = []
      end

      def path
        Service.base_api_path + @resource_name
      end

      def build_request(params = {})
        req = params.merge(merchid: @config.merchant_id)
        @request = CaptureRequest.new(req)
      end

      def submit_authorization
        @response = put(request.payload)
      end

      private

      def put(body = nil)
        response = @connection.put(path, body)
        CaptureResponse.new(response.body)
      end
    end
  end
end
