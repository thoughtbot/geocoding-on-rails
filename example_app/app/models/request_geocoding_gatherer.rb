class RequestGeocodingGatherer
  def initialize(request)
    @request = request
  end

  def current_location
    if city && state
      [city, state].join ', '
    else
      ''
    end
  end

  private

  delegate :city, :state, to: :location
  delegate :location, to: :@request
end
