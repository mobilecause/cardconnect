module CardConnect
  module Service
    class Refund < ServiceEndpoint
      # Initializes a Refund Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Refund
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/refund'
        @rest_method = 'put'
      end
    end
  end
end
