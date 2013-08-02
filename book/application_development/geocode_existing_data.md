## Geocode Existing Data

Once a model is able to geocode itself, updating existing records with
coordinates becomes the next task at hand. The Geocoder gem provides a scope
(`.not_geocoded`) which returns all records missing latitude and longitude.

` lib/tasks/geocode_locations.rake@4091b9b
