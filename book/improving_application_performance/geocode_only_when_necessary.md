## Geocode Only When Necessary

Currently we're geocoding `Location` objects in an `after_validation` callback.
This approach is less than ideal because it makes our application more likely
to hit the daily rate limit of the external geocoding service. In addition,
we're slowing down our application with unnecessary external requests: Geocoding
with Google takes an average of 75ms. An easy way to improve improve application
performance is to geocode only when the address changes.

### Changes to the Model

To ensure we only geocode when the address changes, we build out
`#geocoding_necessary?` and define the appropriate behavior where
`set_coordinates` only runs when `#geocoding_necessary?` returns `true`:

` app/models/location.rb@cda4d0e

### Testing
* [Testing Objects are Geocoded Only When
  Necessary](#testing-objects-are-geocoded-only-when-necessary)
