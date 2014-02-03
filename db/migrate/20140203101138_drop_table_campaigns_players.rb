class DropTableCampaignsPlayers < ActiveRecord::Migration
  def up
    drop_table :campaigns_players
  end

  def down
    create_table :campaigns_players, id: false do |t|
      t.references :campaign
      t.references :user
    end
    add_index :campaigns_players, [:campaign_id, :user_id], unique: true
  end
end
