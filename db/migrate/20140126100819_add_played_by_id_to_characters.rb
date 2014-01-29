class AddPlayedByIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :played_by_id, :integer
  end
end
