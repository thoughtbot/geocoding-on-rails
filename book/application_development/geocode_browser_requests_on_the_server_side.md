## Geocode Browser Requests on the Server Side

Once data in the application is searchable based on values other than postal
codes, there are a number of usability improvements that can be made; one is
pre-populating the search field with a guess at the city and state of the
user.

### Changes to the Controller and View

The [geocoder][geocoder-github] gem extends the `request` object within Rails
controllers with a new method, `#location`, which exposes information about
both city and state. By creating a new class, `RequestGeocodingGatherer`, to
handle calculating city and state, we're able to keep this logic out of the
controller and have small classes, each with their own responsibility:

` app/models/request_geocoding_gatherer.rb@37d0005

Within the controller, we specify a `class_attribute
:request_geocoding_gatherer` and assign it to our new class to retrieve the
current location string from the `request`:

` app/controllers/locations_controller.rb@37d0005

In the view, we set the search field's placeholder to `@current_location_by_ip`:

` app/views/locations/index.html.erb@37d0005:1,5

### Testing
* [Geocoding with an External Service](#geocoding-with-an-external-service)
