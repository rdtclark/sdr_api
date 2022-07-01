class Campaign < ApplicationRecord
  has_many :investments

  def percentage_raised
    (amount_raised.to_f / self.target_amount.to_f * 100.0).round(2)
  end

  def amount_raised
    self.investments.sum(&:total_multiples_invested) * self.investment_multiplier
  end
end
