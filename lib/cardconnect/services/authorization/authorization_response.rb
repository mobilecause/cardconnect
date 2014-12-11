module CardConnect
  class AuthorizationResponse
    include Utils

    attr_reader :errors

    FIELDS = [:respstat, :retref, :account, :token, :amount, :merchid, :respcode,
              :resptext, :respproc, :avsresp, :cvvresp, :authcode, :commcard]

    attr_accessor *FIELDS

    STATUS_APPROVED = 'A'
    STATUS_RETRY = 'B'
    STATUS_DECLINED = 'C'

    def initialize(response)
      set_attributes(response, FIELDS)
      @errors = []
      process
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
      if [STATUS_RETRY, STATUS_DECLINED].include?(respstat)
        @errors << "#{respcode}: #{resptext}"
      end
    end
  end
end