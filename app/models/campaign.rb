class Campaign < ApplicationRecord
  has_many :investments
  paginates_per 10
  max_paginates_per 50

  def percentage_raised
    (amount_raised.to_f / self.target_amount.to_f * 100.0).round(2)
  end

  def amount_raised
    self.investments.sum(&:total_multiples_invested) * self.investment_multiplier
  end

  def target_amount_div
    self.target_amount / 100.0 rescue 0
  end
end
