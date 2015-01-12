module CardConnect
  class CaptureRequest
    include Utils

    REQUIRED_FIELDS = [:merchid, :retref]

    OPTIONAL_FIELDS = [:authcode, :amount, :invoiceid]

    FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

    attr_accessor *FIELDS

    def initialize(attrs = {})
      set_attributes(attrs, FIELDS)
    end

    def payload
      payload = {}
      FIELDS.each do |field|
        payload.merge!({field => send(field)})
      end
      payload
    end

  end
end
