## Web Requests

### Geocoding Location by Browser Request

Many applications ask users to provide their current location in order to
perform a search for addresses nearby. Often, it's possible to retrieve this
information from the browser request.

### Calculating Coordinates

[Geocoder](https://github.com/alexreisner/geocoder#request-geocoding-by-ip-address)
provides a `#location` method on the `request` object which returns a location
result with latitude and longitude.

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

On the client side, the [W3C Geolocation API](http://dev.w3.org/geo/api/spec-source.html)
provides location data accessible [with JavaScript](http://diveintohtml5.info/geolocation.html#the-code):

```javascript
navigator.geolocation.getCurrentPosition(successCallback, failureCallback);
```
