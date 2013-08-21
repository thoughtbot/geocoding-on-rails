RSpec.configure do |config|
  config.around do |example|
    cached_request_geocoding_gatherer = LocationsController.request_geocoding_gatherer
    LocationsController.request_geocoding_gatherer = NullRequestGeocodingGatherer

    example.run

    LocationsController.request_geocoding_gatherer = cached_request_geocoding_gatherer
  end
end
