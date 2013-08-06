require 'spec_helper'

describe Location do
  it { should validate_uniqueness_of(:store_number) }
end

describe Location, '#valid?' do
  it 'geocodes with Geocoder' do
    location = Location.new(street_line_1: 'Undefined address')
    location.valid?

    expect(location.latitude).to eq geocoder_stub('nonexistent').latitude
    expect(location.longitude).to eq geocoder_stub('nonexistent').longitude
  end
end
