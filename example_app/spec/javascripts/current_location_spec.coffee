#= require spec_helper

describe 'CurrentLocation#getLocation', ->
  describe 'when the deferred object resolves', ->
    it 'returns the location', ->
      resolution = (defer) -> defer.resolve('Boston')

      currentLocation = new ExampleApp.CurrentLocation(resolution)
      currentLocation.getLocation (result) ->
        expect(result).to.equal('Boston')

  describe 'when the deferred object is rejected', ->
    it 'returns a default location', ->
      resolution = (defer) -> defer.reject()

      currentLocation = new ExampleApp.CurrentLocation(resolution)
      currentLocation.getLocation (result) ->
        expect(result).to.equal(ExampleApp.CurrentLocation.DEFAULT_LOCATION)

describe 'CurrentLocation::DEFAULT_LOCATION', ->
  it 'returns "Boston, MA"', ->
    expect(ExampleApp.CurrentLocation.DEFAULT_LOCATION).to.equal 'Boston, MA'
