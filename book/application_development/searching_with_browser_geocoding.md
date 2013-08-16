## Searching with Client-Side Geocoding

In the previous section we referred to the Rails `request` object to reverse
geocode the user's location and prepopulate the search field with the user's
city and state. As an alternative to the server-side approach, we can reverse
geocode the user's location using the [W3C geolocation](http://dev.w3.org/geo/api/spec-source.html)
and [Google
Geocoding](https://developers.google.com/maps/documentation/geocoding/) APIs.

### Changes to the View

In the view, we add a function which calls `getLocation()` on an instance of
`ExampleApp.CurrentLocation` if the search field's placeholder attribute is blank.
We pass the function a callback that sets the placeholder attribute to the
current city and state:

` app/views/locations/index.html.erb@e9f6739:33,40

Next, we build out our `CurrentLocation` class. When a new `CurrentLocation` is
instantiated a call is made to the W3C browser API. The API function
`navigator.geolocation.getCurrentPosition()` requires a success callback
and a failure callback; in this implementation the success callback is a
function which reverse geocodes the geographic coordinates returned. If either
of the two external requests are unsuccessful, the `getLocation()` callback is
executed using `CurrentLocation.DEFAULT_LOCATION`:

` app/assets/javascripts/current_location.coffee@e9f6739

The last step is to create the `ReverseGeocoder` to handle interactions with
the external geocoding service:

` app/assets/javascripts/reverse_geocoder.coffee@e9f6739
