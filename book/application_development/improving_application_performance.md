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

` app/models/geocoder_cache.rb@bb2ba07

Configure the cache store in an initializer:

` config/initializers/geocoder.rb@bb2ba07

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

### Speed Up Proximity Queries with PostGIS

#### What is PostGIS?

[PostGIS](http://postgis.net/) is a powerful spatial database extender for
PostgreSQL. Like PostgreSQL, it is free and open source. Adding PostGIS to
your database enables persistence of geographic data and makes it possible to
retrieve the data with spatial queries using PostGIS functions. While an
exhaustive discussion of PostGIS is outside the scope of this book,
its utility as a tool for speeding up database queries is worth mentioning here.

#### Why is PostGIS Faster?

PostGIS allows geocoded data to be persisted as points on a plane. Proximity
queries using PostGIS are less expensive than non-spatial queries because
locations, represented as geographic points, can be compared using the Pythagorean
theorem. The Geocoder gem's `.near` method, by contrast, compares geographic
coordinates on the fly using the [haversine
formula](http://en.wikipedia.org/wiki/Haversine_formula).

#### How Do I Use PostGIS?

While there are currently few comprehensive and up-to-date resources for using
PostGIS with Rails applications in multiple environments, the challenges of
installing and configuring PostGIS are worth tackling if significant gains in
application performance may be won.

Using PostGIS with Rails requires installing the [ActiveRecord PostGIS
Adapter](https://github.com/dazuma/activerecord-postgis-adapter) and
[RGeo](https://github.com/dazuma/rgeo) gems. To perform proximity searches
using PostGIS, you would add a column to your table of geocoded data to store
a geographic point for each entry. (You would also have to write a rake task
to populate the `geographic_point` column from the latitude and longitude.) You
would use RGeo to configure the ActiveRecord model associated with the table of
geocoded data, and you would write your proximity queries using the `ST_Distance`
and `ST_DWithin` PostGIS functions.

To learn more about PostGIS, consider purchasing a copy of [PostGIS in Action](http://www.manning.com/obe/).
For an example of configuring your Rails application for use with PostGIS, see
[Using PostGIS with Rails](#).
