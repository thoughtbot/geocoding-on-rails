require 'spec_helper'

feature 'Guest searches by postal code' do
  scenario 'only displays locations within the search radius' do
    stub_geocoding_request '12 Winter St., Boston, MA, 02111, US', '02111',
      42.35548199999999, -71.0608386
    stub_geocoding_request '36 2nd St., San Francisco, CA, 94105, US', '94105',
      37.788587, -122.400958

    boston_location = create(:location, :in_boston)
    san_francisco_location = create(:location, :in_san_francisco)

    locations = LocationsOnPage.new
    locations.search boston_location.postal_code

    expect(locations).to include(boston_location)
    expect(locations).not_to include(san_francisco_location)

    locations.search san_francisco_location.postal_code

    expect(locations).not_to include(boston_location)
    expect(locations).to include(san_francisco_location)
  end
end
