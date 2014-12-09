module CardConnect
  class AuthorizationResponse
    include Utils

    attr_reader :errors, :request_payload, :request

    FIELDS = [:respstat, :retref, :account, :token, :amount, :merchid, :respcode,
              :resptext, :respproc, :avsresp, :cvvresp, :authcode, :commcard]

    attr_accessor *FIELDS

    STATUS_APPROVED = 'A'
    STATUS_RETRY = 'B'
    STATUS_DECLINED = 'C'

    def initialize(response)
      if response.is_a?(AuthorizationRequest)
        @request_payload = response.payload
        @errors = response.errors
      else
        set_attributes(response, FIELDS)
        @errors = []
        process
      end
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

    def process
      case respstat
        when STATUS_APPROVED
        when STATUS_RETRY
          @errors << "Request was not approved because of #{respcode}: #{resptext}. Please Retry."
        when STATUS_DECLINED
          @errors << "Request was not approved because of #{respcode}: #{resptext}"
        else
          @errors << "Card Connect made you some problems."
      end
    end
  end
end