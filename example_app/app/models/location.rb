class Location < ActiveRecord::Base
  ADDRESS_FIELDS = %w(street_line_1 street_line_2
    city state postal_code country_code).freeze

  class_attribute :geocoding_service
  self.geocoding_service = Geocoder

  validates :store_number, uniqueness: true
  geocoded_by :address

  after_validation :set_coordinates, if: :geocoding_necessary?

  def self.search_near(term)
    coordinates = geocoding_service.coordinates(term)
    near(coordinates)
  end

  def address
    address_field_values.compact.join ', '
  end

  private

  def address_field_values
    ADDRESS_FIELDS.map { |field| send field }
  end

  def address_changed?
    (changed & ADDRESS_FIELDS).any?
  end

  def geocoding_necessary?
    if new_record?
      missing_coordinates?
    else
      address_changed?
    end
  end

  def missing_coordinates?
    latitude.blank? || longitude.blank?
  end

  def set_coordinates
    self.latitude, self.longitude = geocoding_service.coordinates(address)
  end
end
