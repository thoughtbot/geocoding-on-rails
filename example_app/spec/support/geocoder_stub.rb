module GeocoderStub
  def geocoder_stub(key)
    result_hash = Geocoder::Lookup::Test.read_stub(key).first
    OpenStruct.new(result_hash)
  end
end
