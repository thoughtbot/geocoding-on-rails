class LocationsController < ApplicationController
  def index
    @locations = if search_value.present?
                   Location.near(search_value)
                 else
                   Location.all
                 end
  end

  private

  def search_value
    params[:search] && params[:search][:value]
  end
end
