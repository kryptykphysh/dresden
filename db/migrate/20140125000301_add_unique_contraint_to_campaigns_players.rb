class AddUniqueContraintToCampaignsPlayers < ActiveRecord::Migration
  def up
    remove_index :campaigns_players, [:campaign_id, :user_id]
    add_index :campaigns_players, [:campaign_id, :user_id], unique: true
  end

  def down
    remove_index :campaigns_players, [:campaign_id, :user_id], unique: true
    add_index :campaigns_players, [:campaign_id, :user_id]
  end
end
