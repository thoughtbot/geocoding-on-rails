module GeocodingRequestStub
  def stub_geocoding_request_to_return_coordinates(*coordinates)
    geocoding_service = double('Fake Geocoder', coordinates: coordinates)
    Location.geocoding_service = geocoding_service
  end
end
