class CreateCampaignsPlayers < ActiveRecord::Migration
  def change
    create_table :campaigns_players, id: false do |t|
      t.references :campaign
      t.references :user
    end

    add_index :campaigns_players, [:campaign_id, :user_id]
  end
end
