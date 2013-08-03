class @ExampleApp.Mapper
  constructor: (cssSelector) ->
    @cssSelector = cssSelector
    @map = null
    @bounds = new google.maps.LatLngBounds()
    @latLngs = []

  render: =>
    @_buildMap()
    @_updateCenterOfMap()

    $(window).on 'resize', =>
      google.maps.event.trigger(@map, 'resize')
      @_updateCenterOfMap()

    @_plotCoordinates()

  addCoordinates: (latitude, longitude) ->
    if !_.isEmpty(latitude) and !_.isEmpty(longitude)
      latLng = new google.maps.LatLng(latitude, longitude)
      @bounds.extend latLng
      @latLngs.push latLng

  _buildMap: ->
    @map = new google.maps.Map($(@cssSelector)[0], @_mapOptions())
    @map.fitBounds @bounds

  _updateCenterOfMap: ->
    @map.setCenter @bounds.getCenter()

  _plotCoordinates: ->
    for latLng in @latLngs
      new google.maps.Marker(position: latLng, map: @map)

  _mapOptions: ->
    zoom: 13
    mapTypeId: google.maps.MapTypeId.SATELLITE
