require 'cardconnect/version'

require 'cardconnect/utils'
require 'cardconnect/error'
require 'cardconnect/configuration'
require 'cardconnect/connection'

require 'cardconnect/services/authorization/authorization_request'
require 'cardconnect/services/authorization/authorization_response'
require 'cardconnect/services/capture/capture_request'
require 'cardconnect/services/capture/capture_response'
require 'cardconnect/services/settlement_status/settlement_status_request'
require 'cardconnect/services/settlement_status/settlement_status_response'
require 'cardconnect/services/inquire/inquire_request'
require 'cardconnect/services/inquire/inquire_response'
require 'cardconnect/services/refund/refund_request'
require 'cardconnect/services/refund/refund_response'
require 'cardconnect/services/void/void_request'
require 'cardconnect/services/void/void_response'
require 'cardconnect/services/profile/profile_put_request'
require 'cardconnect/services/profile/profile_put_response'
require 'cardconnect/services/profile/profile_get_request'
require 'cardconnect/services/profile/profile_get_response'
require 'cardconnect/services/profile/profile_delete_request'
require 'cardconnect/services/profile/profile_delete_response'
require 'cardconnect/services/bin/bin_request'
require 'cardconnect/services/bin/bin_response'

require 'cardconnect/services/service_endpoint'
require 'cardconnect/services/authorization/authorization'
require 'cardconnect/services/capture/capture'
require 'cardconnect/services/settlement_status/settlement_status'
require 'cardconnect/services/inquire/inquire'
require 'cardconnect/services/refund/refund'
require 'cardconnect/services/void/void'
require 'cardconnect/services/profile/profile'
require 'cardconnect/services/bin/bin'


module CardConnect
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def connection
      @connection ||= Connection.new.connection
    end
  end
end