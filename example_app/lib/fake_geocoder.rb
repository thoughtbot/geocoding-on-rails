class FakeGeocoder
  def self.[]=(key, value)
    @values[key] = value
  end

  def self.coordinates(key)
    @values.fetch(key)
  end

  def self.clear
    @values = {}
  end
end
