## Geocode Browser Requests on the Client Side

In the previous section we referred to the Rails `request` object to reverse
geocode the user's location and prepopulate the search field with the user's
city and state. As an alternative to the server-side approach, we can reverse
geocode the user's location using the [W3C Geolocation][w3c-geolocation-api]
and [Google Geocoding][google-geocoding-api] APIs.

### Changes to the View

In the view, we add a function which calls `getLocation()` on an instance of
`ExampleApp.CurrentLocation` if the search field's placeholder attribute is blank.
We pass the function a callback which sets the placeholder attribute to the
current city and state:

` app/views/locations/index.html.erb@e9f6739:33,40

Next, we build out our `CurrentLocation` class. When a new `CurrentLocation`
is instantiated a call is made to the [W3C Geolocation
API][w3c-geolocation-api]. The API function
`navigator.geolocation.getCurrentPosition()` requires a success callback and a
failure callback; in this implementation, the success callback is a function
which reverse geocodes the geographic coordinates returned. If either of the
two external requests is unsuccessful, the `getLocation()` callback is
executed using `CurrentLocation.DEFAULT_LOCATION`:

` app/assets/javascripts/current_location.coffee@e9f6739

The last step is to create the `ReverseGeocoder` to handle interactions with
the external geocoding service:

` app/assets/javascripts/reverse_geocoder.coffee@e9f6739

### Testing
* [CoffeeScript Unit Tests](#coffeescript-unit-tests)
