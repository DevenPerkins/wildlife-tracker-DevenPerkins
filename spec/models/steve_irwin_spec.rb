require 'rails_helper'

RSpec.describe SteveIrwin, type: :model do
  it 'must have common_name, latin_name present ' do
    emptySteveIrwin = SteveIrwin.create common_name:"", latin_name:""
    expect(emptySteveIrwin.errors[:common_name]).to_not be_empty
    expect(emptySteveIrwin.errors[:latin_name]).to_not be_empty
  end
end
