module CardConnect
  class AuthorizationRequest

    REQUIRED_FIELDS = [:merchid, :account, :expiry, :amount, :currency]

    OPTIONAL_FIELDS = [:accttype, :name, :address, :city, :region, :country, :phone,
                       :postal, :email, :ecomind, :cvv2, :orderid, :track, :bankaba,
                       :tokenize, :termid, :capture]

    FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

    attr_accessor *FIELDS
    attr_reader :errors

    def initialize(attrs = {})
      @errors = []
      set_attributes(attrs)
    end

    def payload
      payload = {}
      FIELDS.each do |field|
        payload.merge!({field => send(field)})
      end
      payload
    end

    private

    def set_attributes(attributes)
      return if attributes.empty?
      FIELDS.each do |attribute|
        next unless attributes[attribute]
        send("#{attribute}=", attributes[attribute])
      end
    end

  end
end