require "cardconnect/version"

require 'cardconnect/utils'
require 'cardconnect/error'
require 'cardconnect/configuration'
require 'cardconnect/connection'

require 'cardconnect/services/authorization/authorization_request'
require 'cardconnect/services/authorization/authorization_response'
require 'cardconnect/services/capture/capture_request'
require 'cardconnect/services/capture/capture_response'

require 'cardconnect/services/service'
require 'cardconnect/services/authorization/authorization'
require 'cardconnect/services/capture/capture'

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

  end
end
