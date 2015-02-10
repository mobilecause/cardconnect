module CardConnect
  class InquireRequest
    include Utils

    REQUIRED_FIELDS = [:merchid, :retref]

    FIELDS = REQUIRED_FIELDS

    attr_accessor *FIELDS

    def initialize(attrs = {})
      set_attributes(attrs, FIELDS)
    end

    def payload
      "/#{retref}/#{merchid}"
    end

  end
end