module CardConnect
  module Service
    class Inquire
      include Utils

      attr_reader :request, :response

      # Initializes a Inquire Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Inquire
      def initialize(connection = CardConnect.connection)
        @resource_name = '/inquire'
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
        raise CardConnect::MissingParameterError, "retref is not in the list of parameters" unless req.has_key?(:retref)
        @request = "/#{req[:retref]}/#{req[:merchid]}"
      end

      def submit
        raise CardConnect::Error, "Request has not been built" if request.nil? || request.empty?
        @response = get
      end

      private

      def get
        begin
          InquireResponse.new(@connection.get(path + @request).body)
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end
    end
  end
end
