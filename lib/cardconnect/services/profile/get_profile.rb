module CardConnect
  module Service
    class GetProfile < ServiceEndpoint

      attr_accessor :rest_method

      # Initializes an Authorization Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Authorization
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/profile'
        @rest_method = 'get'
      end

      def delete_profile(params = {})
        @rest_method = 'delete'
        build_request(params)
      end

    end
  end
end