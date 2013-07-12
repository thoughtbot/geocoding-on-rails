csv_path = Rails.root.join(*%w(db locations.csv)).to_s

class LocationParser
  def initialize(data)
    @data = data
  end

  def name
    @data['Name']
  end

  def store_number
    @data['Store Number']
  end

  def phone_number
    @data['Phone Number']
  end

  def street_line_1
    @data['Street Line 1']
  end

  def street_line_2
    @data['Street Line 2']
  end

  def city
    @data['City']
  end

  def state
    @data['State']
  end

  def postal_code
    @data['Zip']
  end

  def country_code
    @data['Country']
  end

  def latitude
    @data['Latitude']
  end

  def longitude
    @data['Longitude']
  end

  def attributes
    [:name, :store_number, :phone_number, :street_line_1, :street_line_2, :city,
      :state, :postal_code, :country_code].inject({}) do |result, attribute_name|
      result[attribute_name] = send(attribute_name)
      result
      end
  end
end

CsvIterator.iterate(csv_path) do |row|
  location_parser = LocationParser.new(row)
  attributes = location_parser.attributes
  if attributes[:country_code] == 'US' && attributes[:postal_code].present?
    record = Location.where(store_number: attributes[:store_number]).first_or_initialize
    record.update_attributes(location_parser.attributes)
  end
end
