module CardConnect
  module Service
    class Capture
      include Utils

      attr_reader :request, :response

      # Initializes a Capture Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Capture
      def initialize(connection = CardConnect.connection)
        @resource_name = '/capture'
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
        @request = CaptureRequest.new(req)
      end

      def submit
        raise CardConnect::Error, "Request has not been built" if request.nil?
        @response = put(request.payload)
      end

      private

      def put(body = nil)
        begin
          response = @connection.put(path, body)
          CaptureResponse.new(symbolize_keys(response.body))
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end
    end
  end
end
