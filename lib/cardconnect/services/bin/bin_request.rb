module CardConnect
  module Service
    class BinRequest
      include Utils

      REQUIRED_FIELDS = [:token, :merchid].freeze

      FIELDS = REQUIRED_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new BinGetRequest
      #
      # @param attrs [Hash]
      # @return CardConnect::BinGetRequest
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
        "/#{merchid}/#{token}"
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