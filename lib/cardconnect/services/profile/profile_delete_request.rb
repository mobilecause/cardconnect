module CardConnect
  module Service
    class ProfileDeleteRequest
      include Utils

      # Making acctid required here even though this conflicts with
      # information in the CardConnect docs because I can't get a successful
      # response from their API unless I pass an acctid.  Please let me know
      # if you know how to fix this.
      REQUIRED_FIELDS = [:profileid, :acctid, :merchid]

      OPTIONAL_FIELDS = []

      FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new ProfileDeleteRequest
      #
      # @param attrs [Hash]
      # @return CardConnect::ProfileDeleteRequest
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
        "/#{profileid}/#{acctid}/#{merchid}"
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
