class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.integer :high_concept_id
      t.integer :trouble
      t.integer :campaign_id
      t.integer :player_id

      t.timestamps
    end
  end
end
