module CardConnect
  module Service
    class BinResponse
      include Utils

      FIELDS = [
        :country, :cardusestring, :gsa, :product,
        :corporate, :fsa, :subtype, :purchase, :prepaid, :binlo,
        :issuer, :binhi
      ].freeze

      # Error messages
      BIN_INFO_NOT_FOUND = 'No bin information found'
      TOKEN_NOT_FOUND    = 'Token not found'
      BIN_NOT_ENABLED    = 'Bin feature not enabled for merchant'

      attr_accessor(*FIELDS)
      attr_reader :errors

      def initialize(response)

        set_attributes(response, FIELDS)
       # raise [response, self].inspect
        @errors = []
      end

      def success?
        @errors.empty?
      end

      def body
        FIELDS.collect{|attr| {attr => send(attr)} }.reduce({}, :merge)
      end
    end
  end
end
