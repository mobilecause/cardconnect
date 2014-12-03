require "cardconnect/version"

require 'cardconnect/configuration'
require 'cardconnect/connection'

require 'cardconnect/services/authorization/authorization_request'
require 'cardconnect/services/authorization/authorization_response'

require 'cardconnect/services/service'
require 'cardconnect/services/authorization/authorization'

module CardConnect

  class << self

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def authorization_service
      @authorization_service ||= Service::Authorization.new
    end

    def connection
      @connection ||= Connection.new.connection
    end

  end
end
