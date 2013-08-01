require 'spec_helper'

describe Location do
  it { should validate_uniqueness_of(:store_number) }
end

describe Location, '#valid?' do
  it 'geocodes with Geocoder' do
    location = Location.new(street_line_1: 'Undefined address')
    location.valid?

    expect(location.latitude).to eq geocoder_stub.latitude
    expect(location.longitude).to eq geocoder_stub.longitude
  end

  def geocoder_stub
    result_hash = Geocoder::Lookup::Test.read_stub('nonexistent stub').first
    OpenStruct.new(result_hash)
  end
end
