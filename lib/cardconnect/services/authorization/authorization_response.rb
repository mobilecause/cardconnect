module CardConnect
  class AuthorizationResponse
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
        set_attributes(response)
        @errors = []
        process_response
      end
    end

    def success?
      @errors.empty?
    end

    private

    def set_attributes(attributes)
      attributes = attributes.with_indifferent_access
      return if attributes.empty?
      FIELDS.each do |attribute|
        next unless attributes[attribute]
        send("#{attribute}=", attributes[attribute])
      end
    end

    def process_response
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