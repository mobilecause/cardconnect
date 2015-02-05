require "cardconnect/version"

require 'cardconnect/utils'
require 'cardconnect/error'
require 'cardconnect/configuration'
require 'cardconnect/connection'

require 'cardconnect/services/authorization/authorization_request'
require 'cardconnect/services/authorization/authorization_response'
require 'cardconnect/services/capture/capture_request'
require 'cardconnect/services/capture/capture_response'
require 'cardconnect/services/settlement_status/settlement_status_response'
require 'cardconnect/services/inquire/inquire_response'

require 'cardconnect/services/service'
require 'cardconnect/services/authorization/authorization'
require 'cardconnect/services/capture/capture'
require 'cardconnect/services/settlement_status/settlement_status'
require 'cardconnect/services/inquire/inquire'

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

    def authorization_service
      @authorization_service ||= Service::Authorization.new
    end

    def capture_service
      @capture_service ||= Service::Capture.new
    end

    def settlement_status_service
      @settlement_status_service ||= Service::SettlementStatus.new
    end

    def inquire_service
      @inquire_service ||= Service::Inquire.new
    end

  end
end
