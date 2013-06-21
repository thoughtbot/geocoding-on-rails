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
