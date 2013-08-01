class PostalCode
  def initialize(value)
    @value = value
  end

  def for_geocoding
    if @value.present?
      ('%05d' % @value.to_s.gsub(/\A(\d+)(-\d+)?\z/, '\1').to_i).first(5)
    end
  end

  def coordinates
    if for_geocoding && latlon = for_geocoding.to_latlon
      latlon.split(/\,/).map(&:strip).map(&:to_f)
    else
      []
    end
  end
end
