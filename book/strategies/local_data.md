## Local Data

The most basic approach to integrating geocoding functionality is to maintain a
local resource which maps address information to geographic coordinates.

### Calculating Coordinates

The [Area](#area) gem relies on public domain records and does not make external
requests to geocode addresses. The gem provides a simple interface for converting
zip codes to coordinates by adding the method `#to_latlon` to `String`:

```ruby
'02101'.to_latlng # "42.370567, -71.026964"
```

Although it's possible to use Area to convert city and state to a zip code,
such conversions are unreliable and error-prone because Area operates on static
data:

```ruby
'Washington DC'.to_zip # []
'Washington, DC'.to_zip # ["20001", "20002", ...]
'Washington, D.C.'.to_zip # []
```

While the flaws in the data may be a deterrent to using gems which don't
interact with an external service, geocoding with Area is very fast and
sufficient if you only need to geocode US zip codes.
