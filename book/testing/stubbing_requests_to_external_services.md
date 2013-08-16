## Stubbing Requests to External Services

For testing in the browser, use [localtunnel](http://progrium.com/localtunnel/)
or [ngrok](https://ngrok.com/) to expose your local web server.

### Server-Side Requests

Geocoder provides support for stubbing requests with its `:test` lookup. Create a
spec support file for setting stubs:

` spec/support/geocoder.rb@bf10a3d:1,11

Create a helper method to make the `Geocoder::Lookup::Test` stubs easier
to access:

` spec/support/geocoder_stub.rb@37d0005

` spec/spec_helper.rb@37d0005:16

Example usage:

` spec/models/location_spec.rb@17571c3:7,16

### Client-Side Requests

Add Konacha and Poltergeist to the Gemfile:

` /Gemfile@e9f6739:18,29

Configure Konacha to use Poltergeist:

` config/initializers/konacha.rb@e9f6739

Add Konacha tests to rakefile:

` /Rakefile@e9f6739:8

Create a `spec_helper`:

` spec/javascripts/spec_helper.js.coffee@e9f6739:1

`CurrentLocation` tests:

` spec/javascripts/current_location_spec.coffee@e9f6739

`ReverseGeocoder` test:

` spec/javascripts/reverse_geocoder_spec.js.coffee@e9f6739

`ReverseGeocoder` stubs:

` spec/javascripts/spec_helper.js.coffee@e9f6739:3,33
