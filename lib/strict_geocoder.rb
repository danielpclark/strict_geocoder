require "strict_geocoder/version"
require "strict_geocoder/errors"
require "active_record"
require "geocoder/stores/active_record"
require "strict_geocoder/stores/active_record"

module StrictGeocoder
  ::ActiveRecord::Base.class_eval do
    class << self
      alias_method :_inherited_strict_geocoder, :inherited
      def inherited(child)
        child.extend Geocoder::Store::ActiveRecord::ClassMethods unless \
          child.ancestors.include? Geocoder::Store::ActiveRecord
        child.include StrictGeocoder::Store::ActiveRecord
        _inherited_strict_geocoder(child)
      end
    end
  end
end
