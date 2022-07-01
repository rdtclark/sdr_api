class CreateInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.references :campaign, null: false, foreign_key: true
      t.integer :total_multiples_invested

      t.timestamps
    end
  end
end
