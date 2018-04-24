module CardConnect
  module Service
    class Bin < ServiceEndpoint
      # Initializes a Bin Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Bin
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/bin'
        @rest_method = 'get'
      end
    end
  end
end
