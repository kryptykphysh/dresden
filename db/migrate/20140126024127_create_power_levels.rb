class CreatePowerLevels < ActiveRecord::Migration
  def change
    create_table :power_levels do |t|
      t.string :name
      t.integer :refresh
      t.integer :skill_points
      t.integer :skill_cap_id

      t.timestamps
    end
  end
end
