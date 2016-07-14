module CardConnect
  module Service
    class ProfileResponse
      include Utils

      FIELDS = [:profileid, :acctid, :respstat, :account, :respcode, :resptext, :respproc, :accttype, 
                :expiry, :name, :address, :city, :region, :country, :phone, :postal, :ssnl4, :email, 
                :defaultacct, :license]

      attr_accessor *FIELDS
      attr_reader :errors

      STATUS_APPROVED = 'A'
      STATUS_RETRY = 'B'
      STATUS_DECLINED = 'C'

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
        @errors << resptext if [STATUS_RETRY, STATUS_DECLINED].include?(respstat)
      end
    end
  end
end