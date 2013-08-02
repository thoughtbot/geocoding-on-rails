require 'spec_helper'

describe 'Geocoding by IP address in the request' do
  it 'uses IP address to geocode' do
    visit_homepage_as_ip '555.555.1.1'
    geocoder_stub = geocoder_stub('555.555.1.1')

    expect(suggested_search_value).to eq [geocoder_stub.city, geocoder_stub.state].join ', '
  end

  def visit_homepage_as_ip(ip_address)
    get '/', nil, { 'HTTP_X_REAL_IP' => ip_address }
  end

  def suggested_search_value
    page = Capybara.string(response.body)
    page.field_labeled('Search by Location')['placeholder']
  end
end
