## Improving Application Performance

STUB

### Caching Results from External Requests

The Geocoder gem provides support for caching responses from external geocoding
services by URL. When a request is made to a URL that has been cached,
the cached response is returned and the external service is not queried.

Start by defining a class to encapsulate the cache. Geocoder requires that the
cache object support the following methods:

    store#[](key)

    store#[]=(key, value)

    store#del(url)

    store#keys

The first three methods are called when setting, retrieving, and deleting
key-value pairs. `store#keys` is invoked only when clearing out the cache;
in our implementation, it returns an empty array.

` app/models/geocoder_cache.rb@fe84d87

Configure the cache store in a `Geocoder` initializer:

` config/initializers/geocoder.rb@fe84d87

### Only Geocode Non-Geocoded Objects

STUB
