class @ExampleApp.CurrentLocation
  @DEFAULT_LOCATION = 'Boston, MA'

  constructor: (deferredResolution) ->
    @deferredResolution = deferredResolution || (defer) =>
      navigator.geolocation.getCurrentPosition(
        @_reverseGeocodeLocation(defer), defer.reject
      )

  getLocation: (callback) =>
    successCallback = (value) -> callback(value)
    failureCallback = (value) -> callback(ExampleApp.CurrentLocation.DEFAULT_LOCATION)

    $.Deferred(@deferredResolution).then(successCallback, failureCallback)

  _reverseGeocodeLocation: (deferred) =>
    (geoposition) =>
      reverseGeocoder = new ExampleApp.ReverseGeocoder(
        geoposition.coords.latitude,
        geoposition.coords.longitude
      )
      reverseGeocoder.location(deferred)
