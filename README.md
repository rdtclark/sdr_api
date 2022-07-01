# Campaigns and Investments API (candi)

Candi is a simple API designed to list camapigns and create investments.

It is an [API only rails application](https://guides.rubyonrails.org/api_app.html) with data stored in a Postgresql database.

### System dependencies

* Ruby: 3.2.1
* Rails: 7.0.3 
* Postgresql

### Steps to install

* clone this repo 
```bash
git clone https://github.com/rdtclark/candi.git candi && cd candi
```
* install dependencies
```bash
bundle install
```
* prepare database
```bash
rails db:prepare
```
* run rails server
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
CampaignTest#test_campaign_should_be_valid = 0.04 s = .
CampaignTest#test_perecentage_raised_should_be_correct = 0.00 s = .
CampaignTest#test_campaign_can_have_many_investments = 0.00 s = .
CampaignTest#test_should_get_paginated_index = 0.00 s = .
CampaignTest#test_percentage_raised_should_update_upon_new_investment = 0.00 s = .
InvestmentTest#test_total_multiples_invested_should_be_a_whole_number = 0.00 s = .
InvestmentTest#test_should_create_investment_with_valid_data = 0.00 s = .
```

### How to use
* to list all campaigns visit http://localhost:3000/api/v1/campaigns or use curl as below
```bash
curl --request GET \
  --url http://localhost:3000/api/v1/campaigns
```
* to create an investment using curl in your Terminal
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

* Install Docker here: https://docs.docker.com/get-docker/

* Generate rails skeleton app
```bash
docker compose run --no-deps web rails new . --force --database=postgresql
```
* Linux Only: (change the ownership of the new files, otherwise they are owned by the root user)
```bash
sudo chown -R $USER:$USER .
```
* Now Gemfile is created, build image
```bash
docker compose build
```
* This deployment has its own rails environment so we can bring up the app now. Note the port number is 3001.
```bash
docker compose up
# http://localhost:3001/api/v1/campaigns
# recommended soundtrack: https://open.spotify.com/track/6ByN6v7D5YUogv622VMGrk 🥁
```
* All that remains is to prepare the database
```bash
docker compose run web rake db:prepare
```
