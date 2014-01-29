class AddUniqueIndexOnCharacterIdAndPhaseIdToCharacterPhases < ActiveRecord::Migration
  def change
    add_index :character_phases, [:character_id, :phase_id], unique: true
  end
end
