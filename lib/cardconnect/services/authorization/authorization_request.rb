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

    def valid?
      validate
      return true if @errors.empty?
      false
    end

    def payload
      payload = {}
      FIELDS.each do |field|
        payload.merge!({field => send(field)})
      end
      JSON.generate(payload)
    end

    private

    def set_attributes(attributes)
      return if attributes.empty?
      FIELDS.each do |attribute|
        next unless attributes[attribute]
        send("#{attribute}=", attributes[attribute])
      end
    end

    def validate
      REQUIRED_FIELDS.each do |field|
        @errors << "#{field} cannot be blank" if send(field).nil? || send(field).empty?
      end
    end
  end
end