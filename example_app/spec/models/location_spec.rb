require 'spec_helper'

describe Location do
  it { should validate_uniqueness_of(:store_number) }
end

describe Location, '#valid?' do
  context 'when location has not been geocoded' do
    it 'geocodes location' do
      stub_geocoding_request_to_return_coordinates(45, -70)
      location = Location.new(street_line_1: 'Undefined address')

      location.valid?

      expect(location.latitude).to eq 45
      expect(location.longitude).to eq -70
    end
  end

  context 'when updating location address' do
    it 'geocodes location' do
      stub_geocoding_request_to_return_coordinates(45, -70)
      location = create(
        :location,
        :in_boston,
        latitude: 43.3554819999999,
        longitude: -71.0608386,
        street_line_1: '45 Winter St.'
      )

      location.street_line_1 = '12 Winter St.'
      location.valid?

      expect(location.latitude).to eq 45
      expect(location.longitude).to eq -70
    end
  end

  context 'when location has already been geocoded' do
    it 'does not geocode' do
      location = create(:location, :in_boston_with_coordinates)
      stub_geocoding_request_to_return_coordinates(43, -71)

      location.valid?

      expect(Location.geocoding_service).not_to have_received(:coordinates)
    end
  end
end
