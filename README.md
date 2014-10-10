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

TODO: Write usage instructions here

For Rails in config/initializers/cardconnect.rb

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
