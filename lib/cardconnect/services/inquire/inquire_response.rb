module CardConnect
  class InquireResponse
    include Utils

    attr_reader :errors

    FIELDS = [:merchid, :account, :amount, :currency, :retref, :respcode,
              :respproc, :respstat, :resptext, :setlstat]

    attr_accessor *FIELDS

    # Settlement Status
    AUTHORIZED = 'Authorized' # Txn has not been Captured 
    QUEUED = 'Queued for Capture' # Txn is in flight to Clearing House
    ACCEPTED = 'Accepted' # Txn was accepted for Settlement
    REJECTED = 'Rejected' # Txn was not accepted
    ZERO_AMOUNT = 'Zero Amount' # Txn was $0
    VOIDED = 'Voided' # Txn has been voided
    DECLINED = 'Declined' # Txn had an error

    def initialize(response)
      set_attributes(response, FIELDS)
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

  end
end
