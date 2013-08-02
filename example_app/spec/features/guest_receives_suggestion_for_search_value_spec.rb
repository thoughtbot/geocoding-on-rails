require 'spec_helper'

feature 'Guest receives suggestion for search value' do
  scenario 'only displays locations within the search radius' do
    FakeRequestGeocodingGatherer = Struct.new(:request) do
      def current_location; 'New York, NY'; end
    end
    LocationsController.request_geocoding_gatherer = FakeRequestGeocodingGatherer
    locations = LocationsOnPage.new

    expect(locations.suggested_search_value).to eq 'New York, NY'
  end
end
