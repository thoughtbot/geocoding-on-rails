require 'spec_helper'

describe RequestGeocodingGatherer, '#current_location' do
  it "returns city and state if present on the request's location" do
    request = request_with_location(city: 'Foo', state: 'Bar')
    gatherer = RequestGeocodingGatherer.new(request)
    expect(gatherer.current_location).to eq 'Foo, Bar'
  end

  it "returns an empty string if city is missing" do
    request = request_with_location(state: 'Bar')
    gatherer = RequestGeocodingGatherer.new(request)
    expect(gatherer.current_location).to eq ''
  end

  it "returns an empty string if state is missing" do
    request = request_with_location(city: 'Foo')
    gatherer = RequestGeocodingGatherer.new(request)
    expect(gatherer.current_location).to eq ''
  end

  def request_with_location(options)
    location_info = { city: nil, state: nil }.merge(options)
    double('request', location: double('location', location_info))
  end
end
