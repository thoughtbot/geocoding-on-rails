## Faking an External Service

Define a `geocoding_service` class attribute on the `Location` model:

` app/models/location.rb@0f98380:5,6

Configure RSpec to set and restore class attribute for each test:

` spec/support/geocoding_service.rb@0f98380

Create a helper method that assigns a test double to `Location.geocoding_service`
and stubs requests for coordinates:

` spec/support/geocoding_request_stub.rb@0f98380

` spec/spec_helper.rb@0f98380:11,16

Example usage:

` spec/models/location_spec.rb@0f98380:7,18
