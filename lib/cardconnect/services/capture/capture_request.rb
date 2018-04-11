module CardConnect
  module Service
    class CaptureRequest
      include Utils

      REQUIRED_FIELDS = [:merchid, :retref].freeze

      OPTIONAL_FIELDS = [:authcode, :amount, :invoiceid, :ponumber, :taxamnt].freeze

      FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new Capture Request
      #
      # @param attrs [Hash]
      # @return CardConnect::CaptureRequest
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
        FIELDS.collect{|field| {field => send(field)} }.reduce({}, :merge)
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
