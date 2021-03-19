class CreateSteveIrwins < ActiveRecord::Migration[6.1]
  def change
    create_table :steve_irwins do |t|
      t.string :common_name
      t.string :latin_name
      t.string :kingdom

      t.timestamps
    end
  end
end
