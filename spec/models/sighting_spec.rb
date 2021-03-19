require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'must have date, latitude, and longitude present' do
    emptySighting = Sighting.create date:"", lat_long:""
    expect(emptySighting.errors[:date]).to_not be_empty
    expect(emptySighting.errors[:lat_long]).to_not be_empty
  end
end
