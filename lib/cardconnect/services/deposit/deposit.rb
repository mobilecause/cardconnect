module CardConnect
  module Service
    class Deposit < ServiceEndpoint

      # Initializes a Deposit Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Deposit
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/deposit'
        @rest_method = 'get'
      end

    end
  end
end