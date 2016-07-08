module CardConnect
  module Service
    class Capture < ServiceEndpoint
      # Initializes a Capture Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Capture
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/capture'
        @rest_method = 'put'
      end
    end
  end
end
