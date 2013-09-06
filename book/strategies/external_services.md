## External Services

### Choosing a Service

Selecting a geocoding service is best done with an estimate of the daily
volume of requests your application is likely to make in mind. The free
geocoding services offered by [Google][google-geocoding-api] and
[Yandex][yandex-geocoding-api] are appropriate for most cases, but you can
consider subscribing to a paid service if the rate limits are too low for your
needs.

Google and Yandex offer free services with rate limits of 2,500 and 25,000
requests per day, respectively. Client-side requests to the Google Geocoding
API [do not count toward the rate limit][google-geocoding-rate-limiting].
[Google Maps for Business][google-maps-for-business] is a paid service with a
rate limit of 100,000 requests per day. Other good options for paid services
are [Yahoo BOSS][yahoo-boss] and [Geocoder.ca][geocoder-ca] (US and Canada
only).

### Calculating Coordinates

Gems like [Geocoder](#geocoder) provide a simple interface for querying an
external service to convert any string to a coordinate. External services vary
in support for points of interest (like hotels and airports rather than addresses)
but will provide results for most types of queries.


```ruby
Geocoder.coordinates('Logan Airport')
# [42.36954300000001, -71.020061]

Geocoder.coordinates('washington dc')
# [38.8951118, -77.0363658]
```

The request results will have varying levels of accuracy depending on the
external service. This is significantly better than relying on [local
data](#local-data) because of the external service's ability to infer information
from the string. However, geocoding with an external service is slower than
geocoding locally - a single request will oftentimes take anywhere from 50ms
to 150ms.
