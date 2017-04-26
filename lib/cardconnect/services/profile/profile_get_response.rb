module CardConnect
  module Service
    class ProfileGetResponse
      include Utils

      FIELDS = [:profileid, :acctid, :respstat, :account, :respcode, :resptext, :respproc, :accttype, :expiry,
                :name, :address, :city, :region, :country, :phone, :postal, :ssnl4, :email, :defaultacct, :license, :token]

      attr_accessor(*FIELDS)
      attr_reader :errors

      STATUS_APPROVED = 'A'
      STATUS_NOT_FOUND = 'C'

      def initialize(response)
        set_attributes(response, FIELDS)
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!({attr => send(attr)})
        end
        body
      end

      private

      def process_errors
        @errors << resptext if STATUS_NOT_FOUND == respstat
      end
    end
  end
end
