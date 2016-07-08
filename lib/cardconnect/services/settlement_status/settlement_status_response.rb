module CardConnect
  module Service
    class SettlementStatusResponse
      include Utils

      FIELDS = [:merchid, :batchid, :hoststat, :hostbatch, :respproc, :txns].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      def initialize(response)
        response = response.empty? ? response : response.first
        set_attributes(response, FIELDS)
        parse_transactions
        @errors = []
      end

      def success?
        errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!(attr => send(attr))
        end
        body
      end

      private

      def parse_transactions
        return if txns.nil?
        txns.each_with_index { |txn, i| txns[i] = symbolize_keys(txn) }
      end
    end
  end
end
