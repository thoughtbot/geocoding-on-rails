## Gems

The RubyGem ecosystem is a great place to find existing solutions to geocoding
in Rails applications. Here are a few gems which make geocoding easier within
an ORM context.

### Geocoder

[Geocoder][geocoder-github] is a gem which touts itself as the "Complete Ruby
geocoding solution" and supports geocoding, reverse geocoding, and distance
queries. It works well with most Ruby ORMs and is under active development.

### GeoKit

[GeoKit][geokit] provides a similar feature set to Geocoder; however, it is
not currently in active development.

### Graticule

[Graticule][graticule] allows geocoding with Google, Yahoo, and most other
geocoding services as well as a command line tool. It is often used in
conjunction with the [Acts as Geocodable][acts-as-geocodable] gem, which
provides hooks into `ActiveRecord` and allows for distance queries.

### Area

[Area][area] uses public domain data (instead of relying on an external
service) to convert from cities to zip codes to coordinates.

### GeoIP

[GeoIP][geoip] is a gem which searches the GeoIP database for a host or IP
address and returns location information (including coordinates). MaxMind
provides [free copies of its data][maxmind-free-geoip-database] as well as a [subscription
service][maxmind-geoip-subscription-service].
