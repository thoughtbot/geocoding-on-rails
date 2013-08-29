#= require spec_helper

describe 'Mapper#addCoordinates', ->
  context 'when coordinates are incomplete', ->
    it 'does not add coordinates', ->
      ExampleApp.TestSupport.stubSuccessfulGoogleMapsResponse()
      mapper = new ExampleApp.Mapper('#map')

      mapper.addCoordinates('latitude')

      expect(mapper.bounds.latLngs[0]).to.not.exist

  context 'when coordinates are present', ->
    it 'adds coordinates for plotting on the map', ->
      ExampleApp.TestSupport.stubSuccessfulGoogleMapsResponse()
      mapper = new ExampleApp.Mapper('#map')

      mapper.addCoordinates('latitude', 'longitude')

      expect(mapper.bounds.latLngs[0].latitude).to.equal('latitude')
      expect(mapper.bounds.latLngs[0].longitude).to.equal('longitude')

describe 'Mapper#render', ->
  it 'renders the map', ->
    ExampleApp.TestSupport.stubSuccessfulGoogleMapsResponse()
    mapper = new ExampleApp.Mapper('#map')

    mapper.render()

    expect(mapper.map).to.not.equal(null)
