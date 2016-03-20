# -*- coding: utf-8 -*-
require 'geocoder/sql'
require 'geocoder/stores/base'

##
# Add strict geocoding functionality to any ActiveRecord object.
#
module StrictGeocoder
  module Store
    module ActiveRecord
      include Geocoder::Store::Base

      ##
      # Implementation of 'included' hook method.
      #
      def self.included(base)
        base.class_eval do

          ##
          # Find all objects within a radius of the given location.
          # Location may be either a string to geocode or an array of
          # coordinates (<tt>[lat,lon]</tt>). Also takes an options hash
          # (see Geocoder::Store::ActiveRecord::ClassMethods.near_scope_options
          # for details).
          #
          scope :near!, lambda{ |location, *args|
            point = Geocoder::Calculations.extract_coordinates(location)
            raise StrictGeocoder::InvalidLocation, "The provided location didn't return as valid" \
              and return if point == [
                Geocoder::Calculations::NAN, Geocoder::Calculations::NAN
              ]

            options = near_scope_options(*point, *args)
            select(options[:select]).where(options[:conditions]).
              order(options[:order])
          }
        end
      end
    end
  end
end
