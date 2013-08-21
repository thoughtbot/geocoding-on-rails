require 'spec_helper'

describe FakeGeocoder do
  it 'allows for setting and retrieving geocoded values' do
    FakeGeocoder['search string'] = [12, 34]
    expect(FakeGeocoder.coordinates('search string')).to eq [12, 34]
  end

  it 'raises when trying to retrieve a nonexistent value' do
    expect do
      FakeGeocoder.coordinates('search string')
    end.to raise_error /search string/
  end
end
