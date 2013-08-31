## Unit Tests

In this section, we'll review the techniques we employ in our unit tests
throughout the stages of application development.

Writing unit tests for our models is initially straightforward. Let's start
with `PostalCode`, the object responsible for calculating coordinates given a
postal code.

` spec/models/postal_code_spec.rb@0ce0bfa:3,31

These tests cover the base cases for various types of input: `nil`, `''`,
integers, strings without padding, and strings longer than five characters.

` app/models/postal_code.rb@0ce0bfa:6,10

Next up is ensuring `PostalCode#coordinates` works as expected:

` spec/models/postal_code_spec.rb@0ce0bfa:33,45

` app/models/postal_code.rb@0ce0bfa:12,18

### Geocoding with an External Service

The next step is introducing geocoding with an external service, which we do
with the Geocoder gem. Geocoder provides support for stubbing geocoding requests
with its `:test` lookup.

First we write our test to determine what to stub:

` spec/models/location_spec.rb@37d0005:7,15

Second, we define `GeocoderStub` to make the Geocoder test stubs easier to
interact with:

` spec/support/geocoder_stub.rb@37d0005

Third, we add a stub to a `geocoder.rb` support file.

` spec/support/geocoder.rb@50bf859:1,6

Finally, we include `GeocoderStub` and `Geocoder` in our spec helper:

` spec/spec_helper.rb@37d0005:11,17

When we write more complex tests, we'll need to add a stub which is specific to
a location. For example:

` spec/support/geocoder.rb@37d0005:8,12

### Testing `GeocoderCache`

Testing `GeocoderCache` requires we stub `Rails.cache` to return a cache object:

` spec/models/geocoder_cache_spec.rb@f84a1bd:3,6

With `Rails.cache` stubbed, we can test assigning, retrieving, and deleting cache keys:

` spec/models/geocoder_cache_spec.rb@f84a1bd:8,20

### Testing Objects are Geocoded Only When Necessary

Writing tests to ensure our objects are only geocoded when the address is
updated demonstrates to us we need to do some refactoring. In our unit test
for `Location`, we want to be able to spy on the object receiving the method
handling geocoding. Currently, the object which receives `geocode` -- the
`Location` instance -- is the system under test:

` app/models/location.rb@50bf859:1,5

We'll start by writing a test to help drive our approach to refactoring. In this
test, we rely on an assignable class attribute, `geocoding_service`, which will
handle the entirety of the geocoding. To assign an object to this attribute
allows us to inject the dependency in various situations; in this case, we'll
inject a `double` within the spec to grant us more control over the resulting
`coordinates`.

` spec/models/location_spec.rb@f84a1bd:43,50

To make the test pass, we define a `geocoding_service` class attribute on
`Location`:

` app/models/location.rb@cda4d0e:1,6

We also change our `after_validation` to `:set_coordinates` so we can call
`coordinates` (which `Geocoder` already defines) on `geocoding_service`:

` app/models/location.rb@cda4d0e:11
` app/models/location.rb@cda4d0e:44,46

Finally, we reset the `geocoding_service` class attribute after each test just
like we did for `LocationsController.request_geocoding_gatherer`.

` spec/support/geocoding_service.rb@f84a1bd

### Decoupling Our Application From the Geocoding Service Entirely

With `Location` allowing any object be assigned to the `geocoding_service`
class attribute, we're able to do a significantly larger refactor wherein we
inject a `FakeGeocoder` for every test performing geocoding. There are many
benefits to this approach:

1. It allows us to remove `spec/support/geocoder.rb`: All Geocoder `add_stub`s
   effectively introduce mystery guests.
2. It allows us to be explicit about how each geocoding request works per
   test: We can now choose exactly how the geocoder used by our code responds.
3. It provides a clear seam because we never refer to `Geocoder` explicitly:
   We can swap out `Geocoder` entirely or introduce an adapter to another
   geocoding library with very little work.

We start by removing `geocoder.rb` and rewriting our test to use a helper we
define, `stub_geocoding_request`:

` spec/models/location_spec.rb@cda4d0e:20,32

Next, we define `GeocodingRequestStub` (the module which contains the new
`stub_geocoding_request` method) and include it in our spec helper:

` spec/support/geocoding_request_stub.rb@cda4d0e:1,8

`stub_geocoding_request` allows for mapping any number of strings (values to
be geocoded) to a specific coordinate. Iterating over the list of `strings`,
we use each string as a key within our new `FakeGeocoder`.  `FakeGeocoder`
acts as a dictionary object, mapping keys (strings to geocode) to values (a
specific coordinate).

Because `FakeGeocoder` is not instantiated (the dictionary is stored at a
class level), we'll need to clear out the dictionary before each test:

` spec/support/geocoding_request_stub.rb@cda4d0e:10,14

Finally, we make `GeocodingRequestStub` available to the entire test suite:

` spec/spec_helper.rb@cda4d0e:11,17

We test-drive development of `FakeGeocoder`, ensuring it allows for assignment
(`FakeGeocoder.[]=(key, value)`) and retrieval exactly as we're using it
throughout the existing system (`FakeGeocoder.coordinates(key)`). To safeguard
against typos on our end, any attempt to geocode an undefined value raises an
exception.

` spec/lib/fake_geocoder_spec.rb@cda4d0e

The implementation of `FakeGeocoder` is straightforward; the only method we
don't test directly is `FakeGeocoder.clear`, which is run before each test as
demonstrated above.

` lib/fake_geocoder.rb@cda4d0e

We refactor our other tests to use `FakeGeocoder` where appropriate:

` spec/features/guest_views_all_locations_spec.rb@cda4d0e

Finally, we make one additional change to `Location`: We define our own
method, `search_near`, which uses the `geocoding_service` to calculate
coordinates and pass them to the `near` method defined by the Geocoder gem.

` app/models/location.rb@cda4d0e:13,16

When provided a coordinate, the `near` scope provided by the Geocoder gem does
not geocode the value because the work has been done already; this ensures all
geocoding logic is managed by `Location.geocoding_service`.

Lastly, `LocationsController` needs to take advantage of our new scope.

` app/controllers/locations_controller.rb@cda4d0e:5,12

This decoupling from the Geocoder gem is large; instead of relying on the
Geocoder gem throughout the application and its stubs in the test suite, we
instead rely on a simple interface, `coordinates(value)` and `[]=(key,
value)`, to handle the entirety of our geocoding needs.
