# CardConnect

CardConnect API Ruby Wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cardconnect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cardconnect

## Usage

For Rails in config/initializers/cardconnect.rb

NOTE: Merchant ID can also be passed in with params when building a request. If no ID is passed in then the request will use the ID from the configuration.

```ruby
CardConnect.configure do |config|
  config.merchant_id = '<merchant-id-number>'
  config.api_username = '<api user id>'
  config.api_password = '<api user password>'
  config.endpoint = 'https://url.goeshere.com:6443'
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cardconnect/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
