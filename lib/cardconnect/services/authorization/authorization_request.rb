module CardConnect
  module Service
    class AuthorizationRequest
      include Utils

      REQUIRED_FIELDS = [:merchid, :account, :expiry, :amount, :currency].freeze

      OPTIONAL_FIELDS = [:accttype, :name, :address, :city, :region, :country, :phone,
                         :postal, :email, :ecomind, :cvv2, :orderid, :track, :bankaba,
                         :tokenize, :termid, :capture, :ssnl4, :license, :profile, :userfields,
                         :ponumber, :authcode, :invoiceid, :taxamnt].freeze

      FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new Authorization Request
      #
      # @param attrs [Hash]
      # @return CardConnect::AuthorizationRequest
      def initialize(attrs = {})
        @errors = []
        set_attributes(attrs, FIELDS)
        validate_required_fields
      end

      # Indicates that the request is valid once it is built.
      def valid?
        errors.empty?
      end

      # Builds the request payload
      def payload
        payload = {}
        FIELDS.each do |field|
          payload.merge!(field => send(field))
        end
        payload
      end

      private

      def validate_required_fields
        REQUIRED_FIELDS.each do |field|
          value = send(field)
          value.nil? || value.empty? ? errors.push("#{field.capitalize} is missing") : next
        end
      end
    end
  end
end
