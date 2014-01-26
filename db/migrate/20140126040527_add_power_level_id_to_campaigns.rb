class AddPowerLevelIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :power_level_id, :integer
  end
end
