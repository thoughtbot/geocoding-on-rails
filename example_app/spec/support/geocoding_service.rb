RSpec.configure do |config|
  config.around do |example|
    cached_geocoding_service = Location.geocoding_service
    example.run
    Location.geocoding_service = cached_geocoding_service
  end
end
