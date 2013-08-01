require 'spec_helper'

describe Location do
  it { should validate_uniqueness_of(:store_number) }
end
