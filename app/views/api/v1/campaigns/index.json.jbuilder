json.array! @campaigns.each do |campaign|

  json.id campaign.id
  json.name campaign.name
  json.image campaign.image
  json.sector campaign.sector
  json.country campaign.country
  json.investment_multiplier campaign.investment_multiplier
  json.target_amount campaign.target_amount

  json.percentage_raised campaign.percentage_raised
  json.total_investments campaign.investments.count

end
