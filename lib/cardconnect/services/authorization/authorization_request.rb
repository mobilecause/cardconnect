module CardConnect
  class AuthorizationRequest
    include Utils

    REQUIRED_FIELDS = [:merchid, :account, :expiry, :amount, :currency]

    OPTIONAL_FIELDS = [:accttype, :name, :address, :city, :region, :country, :phone,
                       :postal, :email, :ecomind, :cvv2, :orderid, :track, :bankaba,
                       :tokenize, :termid, :capture]

    FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

    attr_accessor *FIELDS

    # Initializes a new Authorization Request
    #
    # @param attrs [Hash]
    # @return CardConnect::AuthorizationRequest
    def initialize(attrs = {})
      @errors = []
      set_attributes(attrs, FIELDS)
    end

    # Builds the request payload
    def payload
      payload = {}
      FIELDS.each do |field|
        payload.merge!({field => send(field)})
      end
      payload
    end

  end
end