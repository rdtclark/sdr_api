class AddTargetAmountToCampaign < ActiveRecord::Migration[7.0]
  def change
    add_column :campaigns, :target_amount, :integer
  end
end
