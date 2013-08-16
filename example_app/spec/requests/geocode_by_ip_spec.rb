require 'spec_helper'

describe 'Geocoding by IP address in the request' do
  it 'uses IP address to geocode' do
    new_york_ip_address = '555.555.1.1'
    request_geocoding_gatherer = double(
      'Request Geocoding Gatherer',
      current_location: 'New York, NY'
    )
    RequestGeocodingGatherer.stub(new: request_geocoding_gatherer)

    visit_homepage_as_ip(new_york_ip_address)

    expect(suggested_search_value).to eq 'New York, NY'
  end

  def visit_homepage_as_ip(ip_address)
    get '/', nil, { 'HTTP_X_REAL_IP' => ip_address }
  end

  def suggested_search_value
    page = Capybara.string(response.body)
    page.field_labeled('Search by Location')['placeholder']
  end
end
