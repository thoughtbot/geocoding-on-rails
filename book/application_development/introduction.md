## Developing a Rails Application with Geocoding

When building a Rails application, a model will often not be written with any
type of geocoding. The first pieces of functionality are often to display all
locations without any mapping or searching capabilities.

Let's look at some code which merely displays location information straight
from the database:

` app/views/locations/index.html.erb@1cceb15
` app/controllers/locations_controller.rb@1cceb15
` app/models/location.rb@1cceb15

While displaying address information is informative, it does not provide much
value in terms of narrowing down locations.
