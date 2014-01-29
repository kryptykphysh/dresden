class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
      t.string :name

      t.timestamps
    end
  end
end
