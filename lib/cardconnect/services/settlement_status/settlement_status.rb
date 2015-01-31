module CardConnect
  module Service
    class SettlementStatus
      include Utils

      attr_reader :request, :response

      # Initializes a Settlement Service Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::SettlementStatus
      def initialize(connection = CardConnect.connection)
        @resource_name = '/settlestat'
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
        @request = "?"
        req.each do |k, v|
          @request += "#{k}=#{v}&"
        end
      end

      def submit
        raise CardConnect::Error, "Request has not been built" if request.nil? || request.empty?
        @response = get
      end

      private

      def get
        begin
          SettlementStatusResponse.new(@connection.get(path + @request).body)
        rescue Faraday::ResourceNotFound => e
          puts e.message
        end
      end
    end
  end
end
