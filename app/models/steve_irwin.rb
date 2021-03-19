class SteveIrwin < ApplicationRecord
    has_many :sightings

    validates :common_name, :latin_name, presence: true
end
