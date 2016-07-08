module CardConnect
  module Service
    class CaptureResponse
      include Utils

      FIELDS = [:merchid, :account, :amount, :retref, :setlstat].freeze

      attr_accessor(*FIELDS)

      def initialize(response)
        set_attributes(response, FIELDS)
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!(attr => send(attr))
        end
        body
      end
    end
  end
end
