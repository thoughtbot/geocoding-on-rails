class Location < ActiveRecord::Base
  validates :store_number, uniqueness: true
end
