class Location < ActiveRecord::Base
  validates :store_number, uniqueness: true
  geocoded_by :country_code

  after_validation :geocode_by_postal_code, if: :postal_code?

  private

  def geocode_by_postal_code
    self.latitude, self.longitude = PostalCode.new(postal_code).coordinates
  end
end
