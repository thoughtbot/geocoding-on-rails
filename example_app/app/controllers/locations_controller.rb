class LocationsController < ApplicationController
  class_attribute :request_geocoding_gatherer
  self.request_geocoding_gatherer = RequestGeocodingGatherer

  def index
    @current_location_by_ip = geocoded_request_information.current_location
    @locations = if search_value.present?
                   Location.search_near(search_value)
                 else
                   Location.all
                 end
  end

  private

  def search_value
    params[:search] && params[:search][:value]
  end

  def geocoded_request_information
    request_geocoding_gatherer.new(request)
  end
end
