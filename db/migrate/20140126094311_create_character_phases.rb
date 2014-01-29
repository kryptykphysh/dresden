class CreateCharacterPhases < ActiveRecord::Migration
  def change
    create_table :character_phases do |t|
      t.integer :phase_id
      t.integer :character_id
      t.integer :aspect_id
      t.text :content
      t.integer :guest_star_id

      t.timestamps
    end
  end
end
