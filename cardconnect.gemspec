# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cardconnect/version'

Gem::Specification.new do |spec|
  spec.name          = 'cardconnect'
  spec.version       = CardConnect::VERSION
  spec.authors       = ['Tim McKenzie', 'Prashant Mokkarala', 'Jason Taylor']
  spec.email         = ['tim@mobilecause.com', 'prashant@mobilecause.com', 'j.m.taylor1@gmail.com']
  spec.summary       = 'CardConnect API Ruby Client'
  spec.description   = 'CardConnect API Ruby Client'
  spec.homepage      = 'http://developer.cardconnect.com/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 2.7.4'
end
