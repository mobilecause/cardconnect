module CardConnect
  module Service
    class RefundResponse
      include Utils

      FIELDS = [:merchid, :amount, :retref, :authcode, :respcode, :respproc, :respstat, :resptext].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      STATUS_APPROVED = 'A'.freeze
      STATUS_RETRY = 'B'.freeze
      STATUS_DECLINED = 'C'.freeze

      def initialize(response)
        set_attributes(response, FIELDS)
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        FIELDS.collect{|attr| {attr => send(attr)} }.reduce({}, :merge)
      end

      private

      def process_errors
        @errors << resptext if [STATUS_RETRY, STATUS_DECLINED].include?(respstat)
      end
    end
  end
end
