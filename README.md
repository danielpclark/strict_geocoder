# StrictGeocoder

This gem will be versioned by the current releases of geocoder.  Any new methods
will be available on the repo's master branch before version release.

The point of strict methods is to raise an error rather than query the database
with null values.  For example you may use the `:near!` scope from an API and inform
the client/user of an invalid address based on geo lookup failures.

**Implemented for ActiveRecord**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strict_geocoder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install strict_geocoder


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

