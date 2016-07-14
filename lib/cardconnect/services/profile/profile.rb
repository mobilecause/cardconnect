module CardConnect
  module Service
    class Profile < ServiceEndpoint

      # Initializes an Profile(create/update) Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Profile
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/profile'
        @rest_method = 'put'
      end

    end
  end
end