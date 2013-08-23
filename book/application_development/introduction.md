## Introduction

The following chapters outline recommended approaches to building features which
rely on the presence of geocoded data. As a starting point, let's assume we
have a few thousand records in our database, each with accurate address
information.

Without the ability to query our data by location, we can start by displaying
addresses:

` app/views/locations/index.html.erb@1cceb15
` app/controllers/locations_controller.rb@1cceb15
` app/models/location.rb@1cceb15

While displaying this information is informative, it does not provide much
value to users seeking to filter or visualize results by location. To facilitate
meaningful interactions with our data we need to add features like searching and
user geolocation.
