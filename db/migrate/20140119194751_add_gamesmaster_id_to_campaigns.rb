class AddGamesmasterIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :gamemaster_id, :integer
    add_index :campaigns, :gamemaster_id
  end
end
