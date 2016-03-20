# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strict_geocoder/version'

Gem::Specification.new do |spec|
  spec.name          = "strict_geocoder"
  spec.version       = StrictGeocoder::VERSION
  spec.authors       = ["Daniel P. Clark"]
  spec.email         = ["6ftdan@gmail.com"]

  spec.summary       = %q{Add strict scopes for ActiveRecord}
  spec.description   = %q{Add strict scopes for ActiveRecord to Geocoder}
  spec.homepage      = "https://github.com/danielpclark/strict_geocoder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'geocoder', '~> 1.3', '>= 1.3.1'
  spec.add_runtime_dependency 'activerecord', '>= 3.2.22.2'

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'activerecord', '3.2.22.2'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 11.1"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "minitest-reporters", "~> 1.1"
  spec.add_development_dependency "color_pound_spec_reporter", "~> 0.0.5"
end
