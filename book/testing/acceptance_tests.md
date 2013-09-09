## Acceptance Tests

The acceptance tests of our app focus on validating core features such as
displaying location results and a functioning geospatial search. The entirety
of browser interaction is handled through a page object, `LocationsOnPage`,
which exposes methods for interacting with the application and asserting
against information rendered.

` spec/support/features/locations_on_page.rb@f84a1bd

Let's look at the very first acceptance test, which merely verifies locations
are rendered correctly when no search is applied.

` spec/features/guest_views_all_locations_spec.rb@f84a1bd

In this spec, we create two records and ensure both are displayed. This test
doesn't actually verify any geocoding is taking place and likely falls under the
category of a [smoke test][smoke-test].

Next, let's look at the test which ensures searching works correctly:

` spec/features/guest_searches_by_postal_code_spec.rb@f84a1bd

This spec creates two locations and asserts searching by the postal code of
each only returns the closest location. This ensures we both create records,
geocoding them correctly, and filter locations given a search term.

Finally, we verify we're suggesting the correct location (with the placeholder
attribute on our `<input type="text">`) based on IP retrieval. Within
`LocationsController`, we expose a `class_attribute
:request_geocoding_gatherer` which allows us to inject a dependency within our
test suite.

` app/controllers/locations_controller.rb@f84a1bd

In the test, we build a fake object mimicking the behavior of
`RequestGeocodingGatherer` which returns a known value to assert against
(`'New York, NY'`).

` spec/features/guest_receives_suggestion_for_search_value_spec.rb@f84a1bd

As with any class attribute, we must reset its value after each test:

` spec/support/request_geocoding_gatherer.rb@f84a1bd
