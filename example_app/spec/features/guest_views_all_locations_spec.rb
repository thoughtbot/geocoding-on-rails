require 'spec_helper'

feature 'Guest views all locations' do
  scenario 'each location is displayed with the correct information' do
    stub_geocoding_request '12 Winter St., Boston, MA, 02111, US',
      42.35548199999999, -71.0608386
    stub_geocoding_request '36 2nd St., San Francisco, CA, 94105, US',
      37.788587, -122.400958

    boston_location = create(:location, :in_boston)
    san_francisco_location = create(:location, :in_san_francisco)

    locations = LocationsOnPage.new

    expect(locations).to include(boston_location)
    expect(locations).to include(san_francisco_location)
  end
end
