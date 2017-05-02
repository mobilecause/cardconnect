require 'bundler/gem_tasks'
require 'rake/testtask'
require 'cardconnect'

task default: [:test]

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

namespace :cardconnect do
  def cardconnect_configure(args)
    CardConnect.configure do |config|
      config.merchant_id = args.merchant_id
      config.api_username = args.api_username
      config.api_password = args.api_password
      config.endpoint = args.api_endpoint
    end
  end

  desc 'Ping the API Server'
  task :ping, [:merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    response = CardConnect::Connection.new.ping_server
    puts response.body
  end

  desc 'Simulate an Authorization request'
  task :authorize, [:merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    auth_params = {
      'account' => '4111111111111111',
      'accttype' => 'VISA',
      'expiry' => '1220',
      'amount' => '1000',
      'currency' => 'USD',
      'tokenize' => 'Y',
      'profile' => 'Y',
      'name' => 'Bob Johnson',
      'capture' => 'N'
    }

    auth = CardConnect::Service::Authorization.new
    auth.build_request(auth_params)

    if auth.request.valid?
      response = auth.submit
      puts response.body
    else
      puts auth.request.errors
    end
  end

  desc 'Simulate an Authorization Capture request'
  task :auth_capture, [:merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    auth_params = {
      'account' => '4111111111111111',
      'accttype' => 'VISA',
      'expiry' => '1220',
      'amount' => '1000',
      'currency' => 'USD',
      'tokenize' => 'Y',
      'profile' => 'Y',
      'name' => 'Bob Johnson',
      'capture' => 'Y',
      'ponumber' => '1234'
    }

    auth = CardConnect::Service::Authorization.new
    auth.build_request(auth_params)

    if auth.request.valid?
      response = auth.submit
      puts response.body
    else
      puts auth.request.errors
    end
  end

  desc 'Simulate a Capture request'
  task :capture, [:retref, :merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    capture_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'retref' => args.retref
    }

    capture = CardConnect::Service::Capture.new
    capture.build_request(capture_params)

    if capture.request.valid?
      response = capture.submit
      puts response.body
    else
      puts capture.request.errors
    end
  end

  desc 'Simulate a Void request'
  task :void, [:retref, :merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    void_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'retref' => args[:retref]
    }

    void = CardConnect::Service::Void.new
    void.build_request(void_params)

    if void.request.valid?
      response = void.submit
      puts response.body
    else
      puts void.request.errors
    end
  end

  desc 'Simulate a Refund request'
  task :refund, [:retref, :merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    refund_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'retref' => args[:retref]
    }

    refund = CardConnect::Service::Refund.new
    refund.build_request(refund_params)

    if refund.request.valid?
      response = refund.submit
      puts response.body
    else
      puts refund.request.errors
    end
  end

  desc 'Simulate an Inquire request'
  task :inquire, [:retref, :merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    inquire_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'retref' => args[:retref]
    }

    inquire = CardConnect::Service::Inquire.new
    inquire.build_request(inquire_params)

    if inquire.request.valid?
      response = inquire.submit
      puts response.body
    else
      puts inquire.request.errors
    end
  end

  desc 'Simulate a Settlement Status request'
  task :settle_status, [:date, :merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    # Date format is MMDD
    cardconnect_configure(args)

    settle_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'date' => args[:date]
    }

    status = CardConnect::Service::SettlementStatus.new
    status.build_request(settle_params)

    if status.request.valid?
      response = status.submit
      puts response.body
    else
      puts status.request.errors
    end
  end

  desc 'Simulate a Profile request. Available rest methods: [put, get, delete]'
  task :profile, [:rest_method, :profileid, :account_id, :merchant_id, :api_username, :api_password, :api_endpoint] do |_, args|
    cardconnect_configure(args)

    profile_params = {
      'merchid' => CardConnect.configuration.merchant_id,
      'profileid' => args[:profileid],
      'acctid' => args[:account_id]
    }

    profile_put_params = {
      "region": "AK",
      "phone": "7778789999",
      "accttype": "VISA",
      "postal": "19090",
      "ssnl4": "3655",
      "expiry": "0214",
      "city": "ANYTOWN",
      "country": "US",
      "address": "123 MAIN STREET",
      "merchid": args[:merchant_id],
      'profileid' => args[:profileid],
      "name": "TOM JONES",
      "account": "4444333322221111",
      "license": "123451254",
      "defaultacct": "N",
      "profileupdate": "Y"
    }

    profile = CardConnect::Service::Profile.new(args.rest_method)

    if args.rest_method == 'put'
      profile.build_request(profile_put_params)
    else
      profile.build_request(profile_params)
    end

    if profile.request.valid?
      response = profile.submit
      puts response.body
    else
      puts profile.request.errors
    end
  end
end
