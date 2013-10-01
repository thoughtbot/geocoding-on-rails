## Geocode Existing Data

Once a model is able to geocode itself, the next task at hand is updating
existing records with coordinates. The [geocoder][geocoder-github] gem
provides a scope (`.not_geocoded`) which returns all records missing latitude
and longitude.

` lib/tasks/geocode_locations.rake@4091b9b
