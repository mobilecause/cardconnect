module CardConnect
  module Service
    class Profile < ServiceEndpoint
      # Initializes an Profile(create/update) Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Profile
      def initialize(rest_method, connection = CardConnect.connection)
        super(connection)
        @resource_name = '/profile'
        @rest_method = rest_method
      end

      private

      def request_class
        string_to_class("#{self.class}#{self.rest_method.capitalize}Request")
      end

      def response_class
        string_to_class("#{self.class}#{self.rest_method.capitalize}Response")
      end
    end
  end
end
