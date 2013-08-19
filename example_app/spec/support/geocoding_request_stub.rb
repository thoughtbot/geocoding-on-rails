module GeocodingRequestStub
  def stub_geocoding_request(*strings, latitude, longitude)
    strings.each do |string|
      FakeGeocoder[string] = [latitude, longitude]
    end
    Location.geocoding_service = FakeGeocoder
  end
end

RSpec.configure do |config|
  config.before do
    FakeGeocoder.clear
  end
end
