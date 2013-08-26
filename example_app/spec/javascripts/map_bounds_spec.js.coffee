#= require spec_helper

describe 'MapBounds#add', ->
  it 'adds coordinates to plot on the map', ->
    ExampleApp.TestSupport.stubSuccessfulGoogleMapsResponse()
    bounds = new ExampleApp.MapBounds

    bounds.add('latitude', 'longitude')
    bounds.add('latitude2', 'longitude2')

    expect(bounds.latLngs[0].latitude).to.equal('latitude')
    expect(bounds.latLngs[0].longitude).to.equal('longitude')
    expect(bounds.latLngs[1].latitude).to.equal('latitude2')
    expect(bounds.latLngs[1].longitude).to.equal('longitude2')

  it 'extends the map bounds', ->
    ExampleApp.TestSupport.stubSuccessfulGoogleMapsResponse()
    bounds = new ExampleApp.MapBounds
    googleLatLng = google.maps.LatLng

    bounds.add('latitude', 'longitude')
    expectedBounds = bounds.googleLatLngBounds.extendedBounds

    expect(expectedBounds).to.be.a.googleLatLng
    expect(expectedBounds.latitude).to.equal('latitude')
    expect(expectedBounds.longitude).to.equal('longitude')
