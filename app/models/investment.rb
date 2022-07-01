class Investment < ApplicationRecord
  belongs_to :campaign

  validates :campaign, presence: true
  validates :total_multiples_invested, presence: true, numericality: { only_integer: true }

end
