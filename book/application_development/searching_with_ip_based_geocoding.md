## Searching with IP-Based Geocoding

Once data in the application is searchable based on values other than postal
codes, there are a number of usability improvements which can be made; one is
pre-populating the search field with a guess at the city and state of the
user.

### Changes to the Controller and View

The Geocoder gem extends the `request` object within Rails controllers with a
new method, `#location`, which exposes information about both city and state.
Taking the ability to test this functionality into account, we can specify a
`class_attribute :request_geocoding_gatherer` and assign it to a new object to
retrieve a location string from the `request`.

` app/controllers/locations_controller.rb@37d0005

We default the `request_geocoding_gatherer` to a new class,
`RequestGeocodingGatherer`, which gets instantiated with the `request` and
reponds to one method, `#current_location`.

` app/models/request_geocoding_gatherer.rb@37d0005

In the view, we set the search field's placeholder to `@current_location_by_ip`:

` app/views/locations/index.html.erb@37d0005:1,5
