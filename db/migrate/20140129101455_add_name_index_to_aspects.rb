class AddNameIndexToAspects < ActiveRecord::Migration
  def change
    add_index :aspects, :name, unique: true
  end
end
