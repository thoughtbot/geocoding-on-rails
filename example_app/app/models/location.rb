class Location < ActiveRecord::Base
  ADDRESS_FIELDS = %w(street_line_1 street_line_2
    city state postal_code country_code).freeze

  class_attribute :geocoding_service
  self.geocoding_service = Geocoder

  validates :store_number, uniqueness: true
  geocoded_by :address

  after_validation :set_coordinates, if: :address_changed?

  def self.geocode_with(location_geocoder)
    self.geocoder = location_geocoder
  end

  def address
    ADDRESS_FIELDS.map do |field|
      send(field)
    end.compact.join ', '
  end

  private

  def address_changed?
    (changed & ADDRESS_FIELDS).any?
  end

  def set_coordinates
    self.latitude, self.longitude = geocoding_service.coordinates(address)
  end
end
