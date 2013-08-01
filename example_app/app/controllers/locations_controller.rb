class LocationsController < ApplicationController
  def index
    @locations = if near_query.present?
                   Location.near(near_query)
                 else
                   Location.all
                 end
  end

  private

  def near_query
    PostalCode.new(search_value).coordinates
  end

  def search_value
    params[:search] && params[:search][:value]
  end
end
