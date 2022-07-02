# Campaigns and Investments API (candi)

Candi is a simple API designed to list campaigns and create investments.

It's an [API only rails application](https://guides.rubyonrails.org/api_app.html) with data stored in a Postgresql database.

### System dependencies

* Ruby: 3.1.2
* Rails: 7.0.3 
* Postgresql

### Steps to install

1. clone this repo 
```bash
git clone https://github.com/rdtclark/sdr_api.git candi && cd candi
```
2. install dependencies
```bash
bundle install
```
3. prepare database
```bash
rails db:prepare
```
4. run rails server
```bash
rails server
```
### How to run the test suite
Tests are written using Minitest to ensure expected behaviour.
```bash
rails test -v
```
Example output
```bash
ApiV1CampaignsControllerTest#test_should_limit_results_to_max_of_10_campaigns_per_request = 0.22 s = .
ApiV1CampaignsControllerTest#test_should_get_index = 0.00 s = .
CampaignTest#test_campaign_can_have_many_investments = 0.00 s = .
CampaignTest#test_campaign_should_be_valid = 0.00 s = .
CampaignTest#test_perecentage_raised_should_be_correct = 0.00 s = .
InvestmentTest#test_total_multiples_invested_should_be_a_whole_number = 0.00 s = .
InvestmentTest#test_should_create_investment_with_valid_data = 0.00 s = .
```

### How to use
To list all campaigns visit http://localhost:3000/api/v1/campaigns or use curl as below
```bash
# in groups of 10
curl --request GET \
  --url http://localhost:3000/api/v1/campaigns
# in pages
curl --request GET \
  --url http://localhost:3000/api/v1/campaigns/page/2
```
To create an investment using curl in your Terminal
```bash
curl --request POST \
--url http://localhost:3000/api/v1/investments \
--header 'Content-Type: application/json' \
--data '{
"total_multiples_invested": "10",
"campaign_id": "1"
}'
```

### How to run locally using Docker

1. Install Docker here: https://docs.docker.com/get-docker/

2. Generate rails skeleton app
  ```bash
  docker compose run --no-deps web rails new . --force --database=postgresql
  ```
3. Linux Only: (change the ownership of the new files, otherwise they are owned by the root user)
  ```bash
  sudo chown -R $USER:$USER .
  ```
4. Now Gemfile is created, build image
  ```bash
  docker compose build
  ```
5. This deployment has its own rails environment so we can bring up the app now. Note the port number is 3001, and differs for the non-dockerized version.
  ```bash
  docker compose up
  # http://localhost:3001/api/v1/campaigns

  # recommended soundtrack: 
  # Swedish House Mafia - Calling On 
  # 🔊 https://open.spotify.com/track/6ByN6v7D5YUogv622VMGrk 🥁
  ```
6. All that remains is to prepare the database
  ```bash
  docker compose run web rake db:prepare
  ```

### TODO: Modifcations to filter campaigns by different properties 

#### Data Model
* Validate properties against a constant with an array of options e.g. Sector, Country.

#### API
* Create some scopes to more easily handle filtering
```ruby
# Campaign Model
scope :filter_by_sector, -> (sector) { where sector: sector }
scope :filter_by_country, -> (country) { where country: country }
```
* Update controller to add query params, e.g.
```ruby
# Campaign Controller
@campigns = Campaign.where(nil)
@campaigns = @campaigns.sector(params[:sector]) if params[:sector].present?
@campaigns = @campaigns.filter_by_country(params[:country]) if params[:country].present?

# http://localhost.com/api/v1/campaigns?sector=Science&country=UK
```
* Consider caching to improve performance of percentage_raised method 
```ruby
def percentage_raised
  Rails.cache.fetch([self, :percentage_raised]) do
  ...
  end
end
```
