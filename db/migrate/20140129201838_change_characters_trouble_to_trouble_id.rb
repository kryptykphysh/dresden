class ChangeCharactersTroubleToTroubleId < ActiveRecord::Migration
  def up
    change_table :characters do |t|
      t.rename :trouble, :trouble_id
    end
  end

  def down
    change_table :characters do |t|
      t.rename :trouble_id, :trouble
    end
  end
end
