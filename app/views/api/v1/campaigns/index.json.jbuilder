json.total_pages @campaigns.total_pages
json.total_count @campaigns.total_count
json.next_page @campaigns.next_page
json.limit @campaigns.limit_value

json.campaigns @campaigns.each do |campaign|
  json.id campaign.id
  json.name campaign.name
  json.image campaign.image
  json.sector campaign.sector
  json.country campaign.country
  json.investment_multiplier campaign.investment_multiplier
  json.target_amount number_to_currency(campaign.target_amount_div, unit: "£", precision: 0)
  json.percentage_raised campaign.percentage_raised
  json.total_investments campaign.investments.count
end
