class LocationsController < ApplicationController
  def index
    @locations = if search_value.present?
                   Location.near(search_value)
                 else
                   Location.scoped
                 end

    @locations = @locations.limit(1000)
  end

  private

  def search_value
    params[:search] && params[:search][:value]
  end
end
