class Sighting < ApplicationRecord
    belongs_to :steve_irwin

    validates :date, :lat_long, presence: true
end 
