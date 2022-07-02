require 'faker'

99.times do |n|
  name = "example-campaign-#{n+1}"
  image = Faker::LoremFlickr.image
  target_amount = [500000, 1500000, 3000000, 20000000].sample
  sector = ["Science", "Food", "Finance", "Blockchain"].sample
  country = ["UK", "USA", "China", "New Zealand"].sample
  investment_multiplier = [550, 150, 1000, 2000, 5000].sample
  Campaign.create!(
    name: name,
    image: image,
    target_amount: target_amount,
    sector: sector,
    country: country,
    investment_multiplier: investment_multiplier
  )
end

399.times do
  Investment.create!(
    total_multiples_invested: [100, 10, 5, 50, 20].sample, 
    campaign_id: rand(1...99)
  )
end
