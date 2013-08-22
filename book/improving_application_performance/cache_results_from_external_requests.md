## Cache Results from External Requests

The Geocoder gem provides support for caching responses from external geocoding
services by URL. When your application attempts to geocode a location which has
already been geocoded, the gem will return the cached response for the request
URL.

Start by defining a class to encapsulate the cache. In this example we're using
Memcache, but Redis is also supported. Geocoder requires the cache object
implement the following four methods:

1. `CacheClassName#[](key)`
2. `CacheClassName#[]=(key, value)`
3. `CacheClassName#del(key)`
4. `CacheClassName#keys`

The first three methods are invoked when setting, retrieving, and deleting
key-value pairs. The last method, `CacheClassName#keys`, is invoked only when
clearing out the cache; in this implementation, it returns an empty array.

` app/models/geocoder_cache.rb@bb2ba07

Configure the cache store in an initializer:

` config/initializers/geocoder.rb@bb2ba07

Finally, ensure you configure the `cache_store` setting within your Rails
application correctly in your test environment:

` config/environments/test.rb@5fa317f:37

This disallows cached values within your test environment, meaning you can be
confident any tests you write don't rely on state inadvertently from other
tests.
