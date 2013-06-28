## Usage

An application with geocoded data typically manages two aspects of data
interaction:

1. Create data which is specific to a coordinate
2. Query against data specific near a coordinate

Creating data with an associated coordinate usually means the record has
information which can be geocoded, be it a postal code, full address, or point
of interest, such as a library or airport. Often, coordinates get assigned
during validation or persistence callbacks and will only be updated if the
value being geocoded changes.

```ruby
class Location < ActiveRecord::Base
  ADDRESS_FIELDS = [:street_line_1, :street_line_2,
    :city, :state, :postal_code, :country_code].freeze

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    ADDRESS_FIELDS.map {|field_name| send field_name }.compact.join ', '
  end

  private

  def address_changed?
    (changed & ADDRESS_FIELDS).any?
  end
end
```

In this example, the `Location` model defines the method `address` which is
used as the string to calculate its coordinates. We geocode the model after
ensuring it is valid and only when `address_changed?` returns true. This
ensures we don't spend precious time geocoding the record unless it is ready
to be persisted.

Once the record has coordinates assigned, it should be queryable. To find all
locations within twenty miles of Boston:

```ruby
Location.near('Boston', 20)
```
