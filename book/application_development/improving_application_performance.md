## Improving Application Performance

STUB

### Cache Results from External Requests

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

` app/models/geocoder_cache.rb@fe84d87

Configure the cache store in an initializer:

` config/initializers/geocoder.rb@fe84d87

### Geocode Only When Necessary

Currently we're geocoding `Location` objects every time they're validated. This
approach is less than ideal because it makes our application more likely to hit
the daily rate limit of the external geocoding service. In addition, we're
slowing down our application with unnecessary external requests: Geocoding with
Google takes an average of 75ms. An easy way to improve improve application
performance is to only geocode when necessary.

First, we add a condition to the `after_validation` callback on the `Location`
model:

` app/models/location.rb@c7275e2:1,8

Then we build out the `#address_changed?` method to ensure that an object is
geocoded only if its address attributes have changed:

` app/models/location.rb@c7275e2


### Extend Your Database with PostGIS

[PostGIS](http://postgis.net/) is a powerful spatial database extender for
PostgreSQL. By extending your database with PostGIS, you can persist geographic
objects and write spatial queries using PostGIS functions.

While there are currently few up-to-date resources for using PostGIS with Rails
applications in multiple environments, the challenges of installing and
configuring PostGIS are worth tackling if significant gains in application
performance may be won.

For an example of configuring your Rails application for use with PostGIS, see
Using PostGIS with Rails, Tddium, and Heroku.
