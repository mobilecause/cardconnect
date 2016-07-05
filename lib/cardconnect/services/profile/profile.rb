module CardConnect
  module Service
    class Profile < ServiceEndpoint

      # Initializes an Authorization Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Authorization
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/profile'
        @rest_method = 'get'
      end

    end
  end
end