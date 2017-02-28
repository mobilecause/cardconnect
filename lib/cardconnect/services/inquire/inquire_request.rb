module CardConnect
  module Service
    class InquireRequest
      include Utils

      REQUIRED_FIELDS = [:merchid, :retref].freeze

      FIELDS = REQUIRED_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new Inquire Request
      #
      # @param attrs [Hash]
      # @return CardConnect::InquireRequest
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
        "/#{retref}/#{merchid}"
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
