#= require spec_helper

describe 'ReverseGeocoder#location', ->
  context 'when reverse geocoding is successful', ->
    it 'reverse geocodes coordinates', (done) ->
      ExampleApp.TestSupport.stubSuccessfulGoogleResponse 'San Francisco', 'CA'

      buildGeocoderWithCallback success: (result) ->
        expect(result).to.equal 'San Francisco, CA'
        done()

  context 'when reverse geocoding is unsuccessful', ->
    it 'does not return a value', (done) ->
      ExampleApp.TestSupport.stubUnsuccessfulGoogleResponse()

      buildGeocoderWithCallback failure: (result) ->
        expect(result).to.be.undefined
        done()

  buildGeocoderWithCallback = (options) ->
    nullCallback = (result) ->
    successCallback = options.success || nullCallback
    failureCallback = options.failure || nullCallback

    reverseGeocoder = new ExampleApp.ReverseGeocoder(12, 34)

    $.Deferred(
      (defer) -> reverseGeocoder.location(defer)
    ).then(successCallback, failureCallback)
