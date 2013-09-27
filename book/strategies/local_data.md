## Local Data

The most basic approach to integrating geocoding functionality is to maintain a
local resource that maps address information to geographic coordinates.

### Calculating Coordinates

The [area][area] gem relies on public domain records and does not make external
requests to geocode addresses. This gem provides a simple interface for
converting ZIP codes to coordinates by adding the method `#to_latlon` to
`String`:

```ruby
'02101'.to_latlng # "42.370567, -71.026964"
```

Although it's possible to use [area][area] to convert city and state to a ZIP code,
such conversions are unreliable and error-prone because [area][area] operates on static
data:

```ruby
'Washington DC'.to_zip # []
'Washington, DC'.to_zip # ["20001", "20002", ...]
'Washington, D.C.'.to_zip # []
```

While the flaws in the data may be a deterrent to using gems which don't
interact with an external service, geocoding with [area][area] is very fast and
is sufficient if you only need to geocode US ZIP codes.
