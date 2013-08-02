## Search Data Externally

While avoiding requests to third-party services results in faster geocoding
and fewer dependencies, it is often inaccurate. Some postal codes cover
hundreds of square miles; when plotting points on a map or performing a
search, data accuracy is important. By relying on an external service to
geocode data, coordinates become more accurate, searches become more helpful,
and maps provide value.

### Changes to the Controller and View

The controller changes very little; instead of converting the search string (a
postal code) to coordinates, we instead pass the search string directly to
`Location.near`, which will handle the geocoding. Because the Geocoder gem is
hitting an external service, it doesn't need to follow a specific format: the
service will calculate coordinates as best it can. This removes the
restriction of only searching by postal code, allowing users to search
locations in a much more intuitive fashion.

` app/controllers/locations_controller.rb@50bf859

### Changes to the Model

The model changes in two areas: `after_validation` calls the `#geocode` method
(provided by the Geocoder gem) and the model now considers itself geocoded by
`#address` instead of `#country_code`. Every time the model is validated, a
request will be made to an external service to update the model's coordinates.
While naive, it works well and is significantly more accurate than geocoding
by postal code.

` app/models/location.rb@50bf859:3,12
