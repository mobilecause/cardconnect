module CardConnect
  class Configuration
    # Attributes that need to be passed in from the user
    attr_accessor :merchant_id
    attr_accessor :api_username
    attr_accessor :api_password
    attr_accessor :endpoint
    attr_accessor :connection_options

    def initialize
      @connection_options = {}
    end
  end
end
