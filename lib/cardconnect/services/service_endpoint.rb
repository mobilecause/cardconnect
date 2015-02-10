module CardConnect
  module Service
    class ServiceEndpoint
      include Utils

      attr_reader :request, :response, :connection, :resource_name, :rest_method

      # Parent for service endpoints (Authorization, Capture, etc.)
      # This class shouldn't be called directly.  Rather call the end service directly.
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::ServiceEndpoint
      def initialize(connection = CardConnect.connection)
        @resource_name = '/'
        @config = CardConnect.configuration
        @connection = connection
      end

      def path
        base_api_path + resource_name
      end

      def build_request(params = {})
        req = symbolize_keys(params)
        req = req.merge(merchid: @config.merchant_id) unless req.has_key?(:merchid)
        @request = request_class.new(req)
      end

      def submit
        raise CardConnect::Error, "Request has not been built" if request.nil?
        @response = send(rest_method)
      end

      private

      def base_api_path
        '/cardconnect/rest'
      end

      def request_class
        Object.const_get("#{self.class}Request")
      end

      def response_class
        Object.const_get("#{self.class}Response")
      end

      def get
        begin
          response_class.new(connection.get(path + request.payload).body)
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end

      def put
        begin
          response_class.new(connection.put(path, request.payload).body)
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end

    end
  end
end