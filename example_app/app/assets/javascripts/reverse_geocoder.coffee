class @ExampleApp.ReverseGeocoder
  constructor: (latitude, longitude) ->
    @latLng = new google.maps.LatLng(latitude, longitude)
    @geocoder = new google.maps.Geocoder

  location: (deferred) ->
    @geocoder.geocode { latLng: @latLng }, (response, status) =>
      if status is 'OK'
        deferred.resolve(@_locationFromResponse(response[0]))
      else
        deferred.reject()

  _locationFromResponse: (result) ->
    city = result.address_components[2].long_name
    state = result.address_components[4].short_name
    "#{city}, #{state}"
