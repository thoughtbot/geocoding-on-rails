desc "Fill in coordinates for locations which haven't been geocoded"
task geocode_locations: :environment do
  Location.not_geocoded.each do |location|
    location.geocode
    location.save!
  end
end
