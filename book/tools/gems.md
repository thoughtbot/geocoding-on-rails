## Gems

The RubyGem ecosystem is a great place to find existing solutions to geocoding
in Rails applications. Here are a few gems which make geocoding easier within
an ORM context.

### Geocoder

[Geocoder](https://github.com/alexreisner/geocoder) is a gem which touts itself
as the "Complete Ruby geocoding solution" and supports geocoding, reverse
geocoding, and distance queries. It works well with most Ruby ORMs and is
under active development.

### GeoKit

[GeoKit](https://github.com/imajes/geokit) provides a similar feature set to
Geocoder; however, it is not currently in active development.

### Graticule

[Graticule](https://github.com/collectiveidea/graticule) allows geocoding with
Google, Yahoo, and most other geocoding services as well as a command line
tool. It is often used in conjunction with the [Acts as
Geocodable](https://github.com/collectiveidea/acts_as_geocodable) gem, which
provides hooks into `ActiveRecord` and allows for distance queries.

### Area

[Area](https://github.com/jgv/area) uses public domain data (instead of relying
on an external service) to convert from cities to zip codes to coordinates.

### GeoIP

[GeoIP](https://github.com/cjheath/geoip) is a gem which searches the GeoIP
database for a host or IP address and returns location information (including
coordinates). MaxMind provides free copies of its data as well as a
[subscription service](http://www.maxmind.com/en/geolocation_landing).
