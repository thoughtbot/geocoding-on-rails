require 'spec_helper'

describe GeocoderCache do
  around do |example|
    store, Rails.application.config.cache_store = Rails.application.config.cache_store, ActiveSupport::Cache.lookup_store(:memory_store)
    silence_warnings { Object.const_set 'RAILS_CACHE', Rails.application.config.cache_store }

    example.run

    silence_warnings { Object.const_set 'RAILS_CACHE', store }
    Rails.application.config.cache_store = store
  end

  it 'allows for cache assignment and retrieval' do
    subject['Boston, MA'] = [22.0, 22.0]
    expect(subject['Boston, MA']).to eq [22.0, 22.0]

    subject['New York, NY'] = [-10.0, -5.0]
    expect(subject['New York, NY']).to eq [-10.0, -5.0]
  end

  it 'allows keys to be deleted' do
    subject['Boston, MA'] = [22.0, 22.0]
    subject.del('Boston, MA')
    expect(subject['Boston, MA']).to be_nil
  end
end
