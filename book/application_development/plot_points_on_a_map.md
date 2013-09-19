## Plot Points on a Map

At this point, all the data has been geocoded; the next step is to display this
information by rendering each location on a map. This allows users to understand
spatial relationships between the data points.

We'll be using the [Google Maps JavaScript API][google-maps-api] to display a
map and plot a marker for each location. Because requests to the Google Maps
API are made on the client side, there are no changes to the controller or
model.

### Changes to the View

Before jumping into querying the maps API, we make some decisions about
how we're going to organize our client-side scripts.

First, we create a namespace for our application:

` app/assets/javascripts/base.coffee@01d053a

Then we create a `javascript.html.erb` partial which will be rendered in the
application layout body:

` app/views/application/_javascript.html.erb@01d053a

` app/views/layouts/application.html.erb@01d053a:10,16

With our initial set-up complete, we now create some CoffeeScript classes to
handle interactions with the maps API. We begin by creating a `Mapper` to
display the map on the page with markers placed at the correct coordinates.

` app/assets/javascripts/mapper.coffee@5bb8973

Next we create a `MapBounds` class which provides a simple interface for
interacting with Google's representation of coordinates and bounds.

` app/assets/javascripts/map_bounds.coffee@5bb8973

We also create a `Map` class to provide a simple interface to the Google Maps
JavaScript API for rendering a responsive map.

` app/assets/javascripts/map.coffee@5bb8973

Finally, in the view we add a function which instantiates a `Mapper` and calls
`addCoordinates()` and `render()` to display a map and plot each location on
page load. We also add a `map` element to the DOM:

` app/views/locations/index.html.erb@59c2f5d:7,33

` app/views/locations/_location.html.erb@a0c7fab
