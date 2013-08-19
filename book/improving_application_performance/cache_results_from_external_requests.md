## Cache Results from External Requests

The Geocoder gem provides support for caching responses from external geocoding
services by URL. When your application attempts to geocode a location that has
already been geocoded, the cached response for the request URL is returned.

Start by defining a class to encapsulate the cache. In this example we're using
Memcache, but Redis is also supported. Geocoder requires the cache object
support the following methods:

    store#[](key)

    store#[]=(key, value)

    store#del(key)

    store#keys

The first three methods are called when setting, retrieving, and deleting
key-value pairs. `store#keys` is invoked only when clearing out the cache;
in this implementation, it returns an empty array.

` app/models/geocoder_cache.rb@bb2ba07

Configure the cache store in an initializer:

` config/initializers/geocoder.rb@bb2ba07
