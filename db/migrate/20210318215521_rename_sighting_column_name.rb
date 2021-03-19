class RenameSightingColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column(:sightings, :animal_id, :steve_irwin_id)
  end
end
