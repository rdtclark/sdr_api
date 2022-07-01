class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :image
      t.decimal :percentage_raised, precision: 5, scale: 4
      t.string :sector
      t.string :country
      t.integer :investment_multiplier

      t.timestamps
    end
  end
end
