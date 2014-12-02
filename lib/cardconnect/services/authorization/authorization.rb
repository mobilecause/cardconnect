module CardConnect
  module Service
    class Authorization
      attr_reader :request, :response

      def initialize
        @resource_name = '/auth'
        @config = CardConnect.configuration
        @errors = []
      end

      def path
        Service.base_api_path + @resource_name
      end

      def build_request(params = {})
        req = params.merge(:merchid => @config.merchant_id)
        @request = AuthorizationRequest.new(req)
      end

      def send_request
        if request.valid?
          conn = Faraday.new(:url => @config.endpoint)

          conn.basic_auth(@config.api_username, @config.api_password)

          cc_response = conn.put path do |req|
            req.headers['Content-Type'] = 'application/json'
            req.body = request.payload
          end

          @response = AuthorizationResponse.new(cc_response.body)
        else
          @response = AuthorizationResponse.new(request)
        end

        @response
      end
    end
  end
end
