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

    auth = CardConnect::Service::Authorization.new
    auth.build_request(auth_params)
    response = auth.submit

    puts response.body
  end

  desc "Simulate an Authorization Capture request"
  task :auth_capture_request, [:merchant_id, :api_username, :api_password, :api_endpoint] do |t, args|
    cardconnect_configure(args)

    auth_params = {
        'account' => '4111111111111111',
        "accttype" => "VISA",
        'expiry' => '1220',
        'amount' => '1000',
        'currency' => 'USD',
        "tokenize" => "Y",
        "capture" => "Y"
    }

    auth = CardConnect::Service::Authorization.new
    auth.build_request(auth_params)
    response = auth.submit

    puts response.body
  end

  desc "Simulate a Capture request"
  task :capture_request, [:retref, :merchant_id, :api_username, :api_password, :api_endpoint] do |t, args|
    cardconnect_configure(args)

    capture_params = {
        'merchid' => CardConnect.configuration.merchant_id,
        'retref' => args.retref
    }

    capture = CardConnect::Service::Capture.new
    capture.build_request(capture_params)
    response = capture.submit

    puts response.body
  end

  desc "Simulate an Inquire request"
  task :inquire, [:retref, :merchant_id, :api_username, :api_password, :api_endpoint] do |t, args|
    cardconnect_configure(args)

    inquire_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'retref' => args[:retref]
    }

    inquire = CardConnect::Service::Inquire.new
    inquire.build_request(inquire_params)
    response = inquire.submit

    puts response.body
  end

  desc "Simulate a Settlement Status request"
  task :settle_status, [:date, :merchant_id, :api_username, :api_password, :api_endpoint] do |t, args|
    # Date format is MMDD
    cardconnect_configure(args)

    settle_params = {
        'merchid' => CardConnect.configuration.merchant_id,
        'date' => args[:date]
    }

    status = CardConnect::Service::SettlementStatus.new
    status.build_request(settle_params)
    response = status.submit

    puts response.body
  end

end