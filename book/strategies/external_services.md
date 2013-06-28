## External Services

### Choosing a Service

Selecting a geocoding service is best done with an estimate of the daily volume
of requests your application is likely to make in mind. The free geocoding services
offered by Google and Yandex are appropriate for most cases, but you can consider
subscribing to a paid service if the rate limits are too low for your needs.

Google and Yandex offer free services with rate limits of 2,500 and 25,000
requests per day, respectively. Client-side requests to the Google Geocoding API
[do not count toward the rate limit](https://developers.google.com/maps/articles/geocodestrat#client).
[Google Maps for Business](https://developers.google.com/maps/documentation/business/)
is a paid service with a rate limit of 100,000 requests per day. Other good
options for paid services are [Yahoo BOSS](http://developer.yahoo.com/boss/geo/)
and [GeoCoder.ca](http://geocoder.ca/?services=1) (US and Canada only).

### Calculating Coordinates

Gems like [Geocoder](#geocoder) provide a simple interface for converting any
string to a coodinate. Based on the external service, it will have varying
levels of accuracy but is significantly better than relying on local data
because of the external service's ability to infer information from the
string.

```ruby
Geocoder.search('Logan Airport').first.coordinates # [42.36954300000001, -71.020061]
Geocoder.search('washington dc').first.coordinates # [38.8951118, -77.0363658]
```

External services vary in support for points of interest (like hotels and
airports rather than addresses) but will provide results for most types of
queries. Geocoding with an external service will be slower - oftentimes it
will take anywhere between 50ms and 150ms to geocode a string.
