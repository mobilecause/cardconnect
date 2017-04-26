module CardConnect
  module Service
    class ProfileDeleteResponse
      include Utils

      FIELDS = [:resptext, :respcode, :respproc, :respstat, :profileid, :acctid]

      attr_accessor(*FIELDS)
      attr_reader :errors

      STATUS_APPROVED = 'A'
      STATUS_NOT_FOUND = 'C'

      def initialize(response)
        set_attributes(response, FIELDS)
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!({attr => send(attr)})
        end
        body
      end

      private

      def process_errors
        @errors << resptext if STATUS_NOT_FOUND == respstat
      end
    end
  end
end
