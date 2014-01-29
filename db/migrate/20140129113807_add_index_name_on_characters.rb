class AddIndexNameOnCharacters < ActiveRecord::Migration
  def change
    add_index :characters, :name, unique: true
  end
end
