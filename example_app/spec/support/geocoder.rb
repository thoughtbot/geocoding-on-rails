Geocoder.configure(:lookup => :test, ip_lookup: :test)

Geocoder::Lookup::Test.set_default_stub [{
  'latitude' => 12,
  'longitude' => 34,
}]

Geocoder::Lookup::Test.add_stub '12 Winter St., Boston, MA, 02111, US', [{
  'latitude' => 42.35548199999999,
  'longitude' => -71.0608386,
}]

Geocoder::Lookup::Test.add_stub '36 2nd St., San Francisco, CA, 94105, US', [{
  'latitude' => 37.788587,
  'longitude' => -122.400958,
}]

Geocoder::Lookup::Test.add_stub '02111', [{
  'latitude' => 42.3514653,
  'longitude' => -71.0601767,
}]

Geocoder::Lookup::Test.add_stub '94105', [{
  'latitude' => 37.7890183,
  'longitude' => -122.3915063,
}]

Geocoder::Lookup::Test.add_stub '555.555.1.1', [{
  'ip' => '555.555.1.1',
  'city' => 'New York',
  'state' => 'NY',
}]
