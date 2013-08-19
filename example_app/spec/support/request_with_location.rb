module RequestWithLocation
  def request_with_location(options)
    location_info = { city: nil, state: nil }.merge(options)
    double('request', location: double('location', location_info))
  end
end

RSpec.configure do |config|
  config.include RequestWithLocation
end
