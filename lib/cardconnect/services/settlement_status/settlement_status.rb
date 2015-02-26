module CardConnect
  module Service
    class SettlementStatus < ServiceEndpoint

      # Initializes a Settlement Status Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::SettlementStatus
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/settlestat'
        @rest_method = 'get'
      end

    end
  end
end
