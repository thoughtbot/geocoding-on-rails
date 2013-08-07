class GeocoderCache
  CACHE_KEY = 'geocoder_cache'

  def initialize(store = Rails.cache)
    @store = store
  end

  def []=(key, value)
    if value.nil?
      del key
    else
      write_to_store key, value
    end
  end

  def [](key)
    read_from_store key
  end

  def keys
    []
  end

  def del(key)
    store.delete full_key(key)
  end

  private

  def full_key(key)
    [CACHE_KEY, key].join(' ').parameterize
  end

  def read_from_store(key)
    store.read full_key(key)
  end

  def store
    @store
  end

  def write_to_store(key, value)
    store.write full_key(key), value
  end
end
