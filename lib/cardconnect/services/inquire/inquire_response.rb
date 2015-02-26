module CardConnect
  module Service
    class InquireResponse
      include Utils

      FIELDS = [:merchid, :account, :amount, :currency, :retref, :respcode,
                :respproc, :respstat, :resptext, :setlstat]

      attr_accessor *FIELDS
      attr_reader :errors

      def initialize(response)
        set_attributes(response, FIELDS)
        @errors = []
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

    end
  end
end
