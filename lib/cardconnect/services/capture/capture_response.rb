module CardConnect
  module Service
    class CaptureResponse
      include Utils

      FIELDS = [:merchid, :account, :amount, :retref, :setlstat, :respproc,
                :resptext, :commcard, :respstat, :respcode,
                :batchid, :token].freeze

      # Settlement Statuses
      TXN_NOT_FOUND = 'Txn not found' # The Retref was not found
      AUTHORIZED    = 'Authorized' # Auth only, not captured
      QUEUED        = 'Queued for Capture' # Queued for the Processor
      ZERO_AMOUNT   = 'Zero Amount' # Capture (and Auth) were Voided
      ACCEPTED      = 'Accepted' # Accepted by the Processor
      REJECTED      = 'Rejected' # Rejected by the Processor

      attr_accessor(*FIELDS)

      def initialize(response)
        set_attributes(response, FIELDS)
      end

      def body
        FIELDS.collect{|attr| {attr => send(attr)} }.reduce({}, :merge)
      end
    end
  end
end
