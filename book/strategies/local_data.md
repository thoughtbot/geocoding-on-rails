## Local Data

### Calculating Coordinates

Gems like [Area](#area) provide a simple interface for converting city/state
strings to zip codes, as well as zip codes to coordinates. It adds the
methods `#to_zip` and `#to_latlon` to `String`.

```ruby
'Boston, MA'.to_zip # ["02101", "02102", ...]
'02101'.to_latlng # "42.370567, -71.026964"
```

With two (awkward) steps, you can convert city and state into coordinates:

```ruby
class SearchTermParser
  def initialize(search)
    @search = search
  end

  def coordinates
    lat_long_string.split(',').map(&:to_f)
  end

  private

  def lat_long_string
    (zip_codes_for_search.first || null_zip_code).to_latlon
  end

  def zip_codes_for_search
    @search.to_zip
  end

  def null_zip_code
    OpenStruct.new(to_latlon: '')
  end
end
```

The `SearchTermParser` only handles cities as written; handling zip codes adds
another level of complexity. Because gems like this operate on static data, it
also becomes quite easy to find flaws:

```ruby
'Washington DC'.to_zip # []
'Washington, DC'.to_zip # ["20001", "20002", ...]
'Washington, D.C.'.to_zip # []
```

While the flaws in the data may be a deterrent to using gems which don't
interact with an external service, they are very fast at handling data and
work well for data that does not require interpretation like zip codes.
