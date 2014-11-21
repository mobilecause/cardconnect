require "cardconnect/version"

require 'faraday'
require 'json'

require 'cardconnect/configuration'

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

    def auth
      Service::Authorization.new.request
    end
  end
end
