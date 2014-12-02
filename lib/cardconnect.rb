require "cardconnect/version"

require 'faraday'
require 'json'

require 'cardconnect/configuration'
require 'cardconnect/authorization_request'
require 'cardconnect/authorization_response'

require 'cardconnect/services/service'
require 'cardconnect/services/authorization'

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

  end
end
