class Location < ActiveRecord::Base
  validates :store_number, uniqueness: true
  geocoded_by :address

  after_validation :geocode

  def address
    [street_line_1, street_line_2, city, state,
      postal_code, country_code].compact.join ', '
  end
end
