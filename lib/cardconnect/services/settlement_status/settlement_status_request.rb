module CardConnect
  class SettlementStatusRequest
    include Utils

    REQUIRED_FIELDS = [:merchid, :date]

    FIELDS = REQUIRED_FIELDS

    attr_accessor *FIELDS

    def initialize(attrs = {})
      set_attributes(attrs, FIELDS)
    end

    def payload
      payload = "?"
      FIELDS.each do |k, v|
        payload += "#{k}=#{v}&"
      end
      payload
    end

  end
end