require 'spec_helper'

feature 'Guest views all locations' do
  scenario 'each location is displayed with the correct information' do
    stub_geocoding_request_to_return_coordinates(43, -71)
    boston_location = create(:location, :in_boston)
    san_francisco_location = create(:location, :in_san_francisco)

    locations = LocationsOnPage.new

    expect(locations).to include(boston_location)
    expect(locations).to include(san_francisco_location)
  end
end
