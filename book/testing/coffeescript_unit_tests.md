## CoffeeScript Unit Tests

We'll use [Konacha][konacha] to write unit tests
for our CoffeeScript. [Konacha][konacha] relies on the
[Mocha test framework][mocha] and
[Chai assertion library][chai] for executing the tests and
[Poltergeist][poltergeist] to run the tests in-memory within a rake task.

First, we add [Konacha][konacha] and [Poltergeist][poltergeist] to the Gemfile:

` Gemfile@e9f6739:18,29

We make sure the `rake` command runs our JavaScript tests as well as our RSpec
tests by adding the `konacha:run` task to the Rakefile:

` Rakefile@e9f6739:8

We configure [Konacha][konacha] to use
[Poltergeist][poltergeist] in an initializer:

` config/initializers/konacha.rb@e9f6739

We create a spec helper and include `application.js`:

` spec/javascripts/spec_helper.js.coffee@e9f6739:1

### Testing `ExampleApp.CurrentLocation`

Our first test ensures that `CurrentLocation#getLocation` returns a location
upon successful resolution:

` spec/javascripts/current_location_spec.coffee@e9f6739:1,10

Next, we assert a default location is returned if the resolution is rejected:

` spec/javascripts/current_location_spec.coffee@e9f6739:12,18

Finally, we ensure `CurrentLocation::DEFAULT_LOCATION` returns the expected
value:

` spec/javascripts/current_location_spec.coffee@e9f6739:20,22

### Testing `ExampleApp.ReverseGeocoder`

To test `ReverseGeocoder#location`, we'll need to stub requests to the
external geocoding service. First we test the success callback is executed if
reverse geocoding is successful:

` spec/javascripts/reverse_geocoder_spec.js.coffee@e9f6739:1,10

We define `ExampleApp.TestSupport.stubSuccessfulGoogleResponse` in our spec
helper:

` spec/javascripts/spec_helper.js.coffee@e9f6739:3,23

We define the `buildGeocoderWithCallback` helper function which returns
a [jQuery Deferred object][jquery-deferred] with the
provided callbacks configured correctly:

` spec/javascripts/reverse_geocoder_spec.js.coffee@e9f6739:20,29

With the assertions complete when testing a successful resolution, we can now
verify `ReverseGeocoder#location` executes the failure callback when reverse
geocoding is unsuccessful:

` spec/javascripts/reverse_geocoder_spec.js.coffee@e9f6739:12,18

` spec/javascripts/spec_helper.js.coffee@e9f6739:25,33

[konacha]: https://github.com/jfirebaugh/konacha
[poltergeist]: https://github.com/jonleighton/poltergeist
[mocha]: http://visionmedia.github.io/mocha/
[chai]: http://chaijs.com/
[jquery-deferred]: http://api.jquery.com/jQuery.Deferred/