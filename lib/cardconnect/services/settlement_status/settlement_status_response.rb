module CardConnect
  module Service
    class SettlementStatusResponse
      include Utils

      attr_reader :errors

      FIELDS = [:merchid, :batchid, :hoststat, :hostbatch, :respproc, :txns]

      attr_accessor *FIELDS

      # Settlement Status
      # appears in hoststat field
      BLANK = "Blank" # Queued for the Processor
      GB = "GB" # Accepted by the Processor
      MB = "MB" # Some Txns Accepted/Some Rejected
      BB = "BB" # Rejected by the Processor

      def initialize(response)
        set_attributes(response.first, FIELDS)
        parse_transactions
        @errors = []
      end

      def success?
        @errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!({attr => send(attr)})
        end
        body
      end

      private

      def parse_transactions
        return if txns.nil?
        txns.each_with_index { |txn, i| self.txns[i] = symbolize_keys(txn) }
      end

    end
  end
end
