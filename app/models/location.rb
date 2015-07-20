class Location < ActiveRecord::Base
  belongs_to :link
  # sends out information to the google maps API using the geocode Gem
  geocoded_by :address
  # usually sent after validation - only do it when the address is changed (will use dirty tracking)
  after_validation :geocode, :if => :address_changed?
end
