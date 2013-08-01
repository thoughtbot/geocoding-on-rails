require 'spec_helper'

describe PostalCode, '#for_geocoding' do
  it 'returns a five-digit code' do
    expect(postal_code_for_geocoding('123456')).to eq '12345'
  end

  it 'pads results' do
    expect(postal_code_for_geocoding('1234')).to eq '01234'
  end

  it 'handles integer values' do
    expect(postal_code_for_geocoding(1234)).to eq '01234'
  end

  it 'handles ZIP+4 codes' do
    expect(postal_code_for_geocoding('12345-6789')).to eq '12345'
  end

  it 'returns nil with a nil value' do
    expect(postal_code_for_geocoding(nil)).to be_nil
  end

  it 'returns nil with a blank value' do
    expect(postal_code_for_geocoding('')).to be_nil
  end

  def postal_code_for_geocoding(value)
    PostalCode.new(value).for_geocoding
  end
end

describe PostalCode, '#coordinates' do
  it 'uses the geocoding value to calculate' do
    expect(PostalCode.new('02115').coordinates).to eq ['02115'.to_lat.to_f, '02115'.to_lon.to_f]
  end

  it 'handles postal codes which cannot be converted to coordinates' do
    expect(PostalCode.new('12000').coordinates).to eq []
  end

  it 'handles nil' do
    expect(PostalCode.new(nil).coordinates).to eq []
  end
end
