% Geocoding on Rails
% thoughtbot; Laila Winner; Josh Clayton

\clearpage

# Introduction

<<[introduction/introduction.md]

\mainmatter
\part{Strategies}

<<[strategies/geocoding_in_rails_applications.md]

<<[strategies/local_data.md]

<<[strategies/external_services.md]

<<[strategies/web_requests.md]

\part{Tools}

<<[tools/selection.md]

<<[tools/gems.md]

\part{Application Development}

<<[application_development/introduction.md]

<<[application_development/local_search_data.md]

<<[application_development/plot_points_on_a_map.md]

<<[application_development/external_search_data.md]

<<[application_development/geocode_existing_data.md]

<<[application_development/geocode_browser_requests_on_the_server_side.md]

<<[application_development/geocode_browser_requests_on_the_client_side.md]

\part{Improving Application Performance}

<<[improving_application_performance/introduction.md]

<<[improving_application_performance/cache_results_from_external_requests.md]

<<[improving_application_performance/geocode_only_when_necessary.md]

<<[improving_application_performance/speed_up_proximity_queries_with_postgis.md]

\part{Testing}

<<[testing/introduction.md]

<<[testing/acceptance_tests.md]

<<[testing/unit_tests.md]

<<[testing/coffeescript_unit_tests.md]

[geocoding-on-rails-example-app-github]: https://github.com/thoughtbot/geocoding_on_rails/tree/master/example_app
[geocoding-on-rails-example-app-readme]: https://github.com/thoughtbot/geocoding_on_rails/blob/master/example_app/README.md

[geocoder-github]: https://github.com/alexreisner/geocoder
[geocoder-geocode-by-ip]: https://github.com/alexreisner/geocoder#request-geocoding-by-ip-address
[geokit]: https://github.com/imajes/geokit
[graticule]: https://github.com/collectiveidea/graticule
[acts-as-geocodable]: https://github.com/collectiveidea/acts_as_geocodable
[area]: https://github.com/jgv/area
[geoip]: https://github.com/cjheath/geoip
[maxmind-free-geoip-database]: http://dev.maxmind.com/geoip/legacy/geolite
[maxmind-geoip-subscription-service]: http://www.maxmind.com/en/geolocation_landing

[google-geocoding-api]: https://developers.google.com/maps/documentation/geocoding/
[google-geocoding-rate-limiting]: https://developers.google.com/maps/articles/geocodestrat#client
[google-maps-api]: https://developers.google.com/maps/documentation/javascript/
[google-maps-for-business]: https://developers.google.com/maps/documentation/business/
[yandex-geocoding-api]: http://api.yandex.com/maps/
[yahoo-boss]: http://developer.yahoo.com/boss/geo/
[geocoder-ca]: http://geocoder.ca/?services=1

[w3c-geolocation-api]: http://dev.w3.org/geo/api/spec-source.html
[browser-geolocation-example]: http://diveintohtml5.info/geolocation.html#the-code

[postgis]: http://postgis.net
[activerecord-postgis-adapter]: https://github.com/dazuma/activerecord-postgis-adapter
[rgeo]: https://github.com/dazuma/rgeo
[postgis-in-action-book]: http://www.manning.com/obe/
[haversine-formula]: http://en.wikipedia.org/wiki/Haversine_formula

[smoke-test]: http://xunitpatterns.com/Smoke%20Test.html
