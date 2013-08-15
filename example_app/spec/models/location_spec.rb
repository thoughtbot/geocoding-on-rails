require 'spec_helper'

describe Location do
  it { should validate_uniqueness_of(:store_number) }
end

describe Location, '#valid?' do
  context 'when location has not been geocoded' do
    it 'geocodes with Geocoder' do
      location = Location.new(street_line_1: 'Undefined address')
      location.valid?

      expect(location.latitude).to eq geocoder_stub('nonexistent').latitude
      expect(location.longitude).to eq geocoder_stub('nonexistent').longitude
    end
  end

  context 'when updating location address' do
    it 'geocodes with Geocoder' do
      location = create(
        :location,
        :in_boston,
        latitude: 43.3554819999999,
        longitude: -71.0608386,
        street_line_1: '45 Winter St.'
      )
      location.street_line_1 = '12 Winter St.'
      location.valid?

      expect(location.latitude).to eq geocoder_stub(
        '12 Winter St., Boston, MA, 02111, US'
      ).latitude
      expect(location.longitude).to eq geocoder_stub(
        '12 Winter St., Boston, MA, 02111, US'
      ).longitude
    end
  end

  context 'when location has already been geocoded' do
    it 'does not geocode' do
      location = create(:location, :in_boston_with_coordinates)
      geocoding_service = double('Fake Geocoder', coordinates: nil)
      Location.geocoding_service = geocoding_service

      geocoding_service.stub(:coordinates)

      location.valid?

      expect(geocoding_service).not_to have_received(:coordinates)
    end
  end
end
