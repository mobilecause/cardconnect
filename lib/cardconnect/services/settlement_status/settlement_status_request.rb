module CardConnect
  module Service
    class SettlementStatusRequest
      include Utils

      REQUIRED_FIELDS = [:merchid, :date]

      FIELDS = REQUIRED_FIELDS

      attr_accessor *FIELDS
      attr_reader :errors

      # Initializes a new Settlement Status Request
      #
      # @param attrs [Hash]
      # @return CardConnect::SettlementStatusRequest
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
        payload = "?"
        FIELDS.each do |field|
          payload += "#{field}=#{send(field)}&"
        end
        payload
      end

      private

      def validate_required_fields
        REQUIRED_FIELDS.each do |field|
          value = send(field)
          value.nil? || value.empty? ? errors.push("#{field} is missing") : next
        end
      end

    end
  end
end