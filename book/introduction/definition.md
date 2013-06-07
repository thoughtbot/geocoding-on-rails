## Geocoding within the Context of a Rails Application

Geocoding is the process of obtaining latitude and longitude with full or
partial address information. Within a Rails application, objects may have
address information which needs to be plotted on a map or compared to other
records in the database; in cases like this, the address should be geocoded to
a geographic coordinate which can be used for displaying information or
querying against.

There are plenty of [gems](#gems) which can be used to automate the process of
geocoding data as it's added or updated. The geocoded object often exposes a
method to be used during the geocoding process; the gem then updates latitude
and longitude itself once it has calculated the object's position.
