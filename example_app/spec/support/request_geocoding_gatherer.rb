RSpec.configure do |config|
  config.around do |example|
    cached_request_geocoding_gatherer = LocationsController.request_geocoding_gatherer
    example.run
    LocationsController.request_geocoding_gatherer = cached_request_geocoding_gatherer
  end

  config.around do |example|
    cached_geocoding_service = Location.geocoding_service
    example.run
    Location.geocoding_service = cached_geocoding_service
  end
end
