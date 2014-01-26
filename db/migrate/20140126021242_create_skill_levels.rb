class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
      t.string :name
      t.integer :modifier

      t.timestamps
    end
  end
end
