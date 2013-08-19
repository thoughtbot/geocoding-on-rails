## Geocode Only When Necessary

Currently we're geocoding `Location` objects in an `after_validation` callback.
This approach is less than ideal because it makes our application more likely
to hit the daily rate limit of the external geocoding service. In addition,
we're slowing down our application with unnecessary external requests: Geocoding
with Google takes an average of 75ms. An easy way to improve improve application
performance is to geocode only when the address changes.

First, we add a condition to the `after_validation` callback on the `Location`
model:

` app/models/location.rb@cda4d0e:1,11

Second, we build out the `#geocoding_necessary?` method to ensure the location instance
is geocoded only if its address attributes have changed:

` app/models/location.rb@cda4d0e
