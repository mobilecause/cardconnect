module CardConnect
  module Service
    class Void < ServiceEndpoint

      # Initializes a Void Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Void
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/void'
        @rest_method = 'put'
      end
    end
  end
end