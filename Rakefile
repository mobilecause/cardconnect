require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/**/*_test.rb"
end

namespace :cardconnect do
  require 'cardconnect'

  def cardconnect_configure(args)
    CardConnect.configure do |config|
      config.merchant_id = args.merchant_id
      config.api_username = args.api_username
      config.api_password = args.api_password
      config.endpoint = args.api_endpoint
    end

  end

  desc "Ping the API Server"
  task :ping, [:merchant_id, :api_username, :api_password, :api_endpoint] do |t, args|
    cardconnect_configure(args)

    response = CardConnect::Connection.new.ping_server
    puts response.body
  end

  desc "Simulate an Authorization request"
  task :auth_request, [:merchant_id, :api_username, :api_password, :api_endpoint] do |t, args|
    cardconnect_configure(args)

    auth_params = {
        'account' => '4111111111111111',
        "accttype" => "VISA",
        'expiry' => '1220',
        'amount' => '1000',
        'currency' => 'USD',
        "tokenize" => "Y"
    }

    auth = CardConnect.authorization_service
    auth.build_request(auth_params)
    response = auth.submit

    puts response.body
  end


    puts response.body
  end

end