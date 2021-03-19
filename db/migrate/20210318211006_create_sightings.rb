class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.datetime :date
      t.string :lat_long
      t.integer :animal_id

      t.timestamps
    end
  end
end
