## Web Requests

### Geocoding Location by Browser Request

Many applications ask users to provide their current location in order to
perform a search for addresses nearby. Often, it's possible to automatically
retrieve this information from the browser request.

### Calculating Coordinates

[Geocoder]((https://github.com/alexreisner/geocoder#request-geocoding-by-ip-address)
provides a `#location` method on the `request` object which returns a location
result with latitude and longitude.

On the client side, the [W3C Geolocation API](http://dev.w3.org/geo/api/spec-source.html)
provides location data that can be access [via
JavaScript](http://diveintohtml5.info/geolocation.html#the-code).
