## Web Requests

### Calculating a User's Location by IP Address

Many applications ask users to provide their current location in order to
perform a search for addresses nearby. However, it's often possible to retrieve this
information from the browser request itself.

The [geocoder][geocoder-github] gem [provides a `#location` method on the
`request` object][geocoder-geocode-by-ip] which returns a location result with
latitude and longitude:

```ruby
> request.location
=> #<Geocoder::Result::Freegeoip:0x007f8ecca5d608
     @cache_hit=true,
     @data= {
       "ip"=>"199.21.87.210",
       "country_code"=>"US",
       "country_name"=>"United States",
       "region_code"=>"CA",
       "region_name"=>"California",
       "city"=>"Berkeley",
       "zipcode"=>"",
       "latitude"=>37.8716,
       "longitude"=>-122.2728,
       "metro_code"=>"807",
       "areacode"=>"510"
     }>
```

Determining a user's location via IP address interacts with a different set of
services than [attempting to convert a physical address to a
coordinate](#choosing-a-service); in the example above, the
[geocoder][geocoder-github] gem is using the [freegeoip.net][freegeoip]
service.

### Calculating a User's Location from a Web Browser

Within a web browser, the [W3C Geolocation API][w3c-geolocation-api] provides
location data accessible [with JavaScript][browser-geolocation-example]:

```javascript
navigator.geolocation.getCurrentPosition(successCallback, failureCallback);
```

The [W3C Geolocation API][w3c-geolocation-api] is agnostic in how it
calculates location. Depending on the user's device, location may be
determined by GPS, inferred based on network IP addresses or triangulated
based on distance from cellular towers.
