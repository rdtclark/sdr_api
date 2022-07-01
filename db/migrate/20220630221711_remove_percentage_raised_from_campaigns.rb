class RemovePercentageRaisedFromCampaigns < ActiveRecord::Migration[7.0]
  def change
    remove_column :campaigns, :percentage_raised, :decimal, precision: 5, scale: 4
  end
end
