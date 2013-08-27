require 'spec_helper'

describe Location do
  it { should validate_uniqueness_of(:store_number) }
end

describe Location, '#valid?' do
  context 'when location has not been geocoded' do
    it 'geocodes location' do
      stub_geocoding_request 'Undefined address', 45, -70

      location = Location.new(street_line_1: 'Undefined address')
      location.valid?

      expect(location.latitude).to eq 45
      expect(location.longitude).to eq -70
    end
  end

  context 'when updating location address' do
    it 'geocodes location' do
      stub_geocoding_request '45 Winter St., Boston, MA, 02111, US', 42, -75
      stub_geocoding_request '12 Winter St., Boston, MA, 02111, US', 45, -70

      location = create(:location, :in_boston, street_line_1: '45 Winter St.')
      location.street_line_1 = '12 Winter St.'
      location.valid?

      expect(location.latitude).to eq 45
      expect(location.longitude).to eq -70
    end
  end

  it 'does not geocode when initialized with coordinates' do
    Location.geocoding_service = double('geocoding service', coordinates: nil)

    location = build(:location, :in_boston_with_coordinates)
    location.valid?

    expect(Location.geocoding_service).not_to have_received(:coordinates)
  end

  it 'does not geocode when address does not change' do
    location = create(:location, :in_boston_with_coordinates)
    Location.geocoding_service = double('geocoding service', coordinates: nil)

    location.valid?

    expect(Location.geocoding_service).not_to have_received(:coordinates)
  end
end
