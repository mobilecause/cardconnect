module CardConnect
  module Service
    class Inquire < ServiceEndpoint
      # Initializes a Inquire Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Inquire
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/inquire'
        @rest_method = 'get'
      end
    end
  end
end
