## Geocoding in Rails Applications

Geocoding is the process of obtaining coordinates (latitude and longitude)
with full or partial address information. This information commonly takes the
form of a postal code, full street address or the name of a point of interest,
such as a library or airport. An application with geocoded data typically
manages two aspects of data interaction:

1. Create data specific to a coordinate
2. Query against data near a coordinate

Within a Rails application, objects may have address information which needs to
be plotted on a map or compared to other records in the database; in cases like
this, the address must be geocoded to a geographic coordinate which can be
used for displaying information or querying against.

There are [plenty of gems](#gems) that automate the process of geocoding data
as it's added or updated. The geocoded object often exposes a method to be used
during the geocoding process; the gem then updates the object's latitude and
longitude after calculating its position. The gem also handles interactions
with any external geocoding services.

Geocoding can also be performed [on the client side](#web-requests): The W3C
geolocation API is supported by most browsers, and organizations like Google
and Yandex maintain JavaScript APIs for their mapping services.
