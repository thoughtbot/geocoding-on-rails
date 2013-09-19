## Search Data Locally

To start geocoding `Location`, we will add two previously mentioned gems:
[Area](#area) and [Geocoder](#geocoder). Area will be used to geocode
`Location` based on postal code, while Geocoder will be used to do a radial
search for locations within a distance.

### Changes to the Controller and View

Instead of just assigning `Location.all` to `@locations`, we take into account
possible search values; when a value is present, we call the method
`Location.near` (provided by the Geocoder gem), which adds some trigonometry
to the SQL query to search within a certain radius. Without a search term, we
continue to use `Location.all`.

` app/controllers/locations_controller.rb@0ce0bfa:2,8

The method `.near` provided by Geocoder is flexible; at this point, we provide
coordinates calculated by the Area gem (and rolled up into the `PostalCode`
class). By providing coordinates, this ensures the Geocoder gem does not hit
any external services to calculate the center of the search.

` app/controllers/locations_controller.rb@0ce0bfa:12,18

` app/models/postal_code.rb@0ce0bfa

The view changes very little, adding only a form to allow for searching:

` app/views/locations/index.html.erb@0ce0bfa:1,5

### Changes to the Model

The model now needs to do two things: know how to update its coordinates when
the model is updated and recognize itself as a geocodable model.

To update coordinates, adding an `after_validation` callback to geocode the
model is most straightforward.

` app/models/location.rb@0ce0bfa

This callback relies on `PostalCode`, taking advantage of the Area gem to
convert `#postal_code` to useable coordinates.

To add the `.near` class method for searching based on location, the model
needs to declare the attribute or method (passed as a symbol to `geocoded_by`)
by which it can be geocoded.  Because geocoding is being handled by the
`PostalCode` class and not the Geocoder gem, the attribute `:country_code` is
perfectly acceptable for the current use case. When hitting an external
service like Google, however, we'll need to change this attribute to something
more specific, such as street address.

### Testing
* [Unit Tests](#unit-tests)
