$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'strict_geocoder'
gem 'activerecord', '3.2.22.2'
require 'active_record'
require 'minitest/autorun'
require 'color_pound_spec_reporter'
require 'logger'

#Ensure backward compatibility with Minitest 4
Minitest::Test = MiniTest::Unit::TestCase unless defined?(Minitest::Test)
Minitest::Reporters.use! [ColorPoundSpecReporter.new]

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :addresses, force: true  do |t|
    t.text     "city"
    t.text     "state"
    t.text     "postal_code"
    t.float    "latitude"
    t.float    "longitude"
  end
end

module Geocoder
  module Railtie; end
end
require 'geocoder'
ActiveRecord::Base.extend(Geocoder::Model::ActiveRecord)

class Address < ActiveRecord::Base
  geocoded_by :string_of_address
  after_validation :geocode 

  def string_of_address
    [[city,state].join(","), postal_code].join(" ")
  end
end

