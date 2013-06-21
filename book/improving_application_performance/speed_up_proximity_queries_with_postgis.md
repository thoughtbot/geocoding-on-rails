## Speed Up Proximity Queries with PostGIS

### What is PostGIS?

[PostGIS][postgis] is a powerful spatial database extender for PostgreSQL.
Like PostgreSQL, it is free and open-source. Adding PostGIS to your database
enables persistence of geographic data and makes it possible to retrieve the
data with spatial queries using PostGIS functions. While an exhaustive
discussion of PostGIS is outside the scope of this book, its utility as a tool
for speeding up database queries is worth mentioning here.

### Why is PostGIS Faster?

PostGIS allows geocoded data to be persisted as points on a plane. Proximity
queries using PostGIS are less expensive than non-spatial queries because
locations, represented as geographic points, can be compared using the
Pythagorean theorem. The Geocoder gem's `.near` method, by contrast, compares
geographic coordinates on the fly using the [haversine
formula][haversine-formula].

### How Do I Use PostGIS?

While there are currently few comprehensive and up-to-date resources for using
PostGIS with Rails applications in multiple environments, the challenges of
installing and configuring PostGIS are worth tackling if significant gains in
application performance may be won.

Using PostGIS with Rails requires installing the [ActiveRecord PostGIS
Adapter][activerecord-postgis-adapter] and [RGeo][rgeo] gems. To learn more
about PostGIS, consider purchasing a copy of [PostGIS in
Action][postgis-in-action-book].  For an example of configuring your Rails
application for use with PostGIS, see [Using PostGIS in Your
Rails Application](#using-postgis-in-your-rails-application).
