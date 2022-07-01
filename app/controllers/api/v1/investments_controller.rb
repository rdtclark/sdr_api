class Api::V1::InvestmentsController < ApplicationController
  before_action :set_default_format

  def new
    @investment - Investment.new
  end

  def create
    @investment = Investment.create!(investment_params)
    if @investment.save
      render status: :created, json: @investment
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_default_format
    request.format = :json
  end

  def investment_params
    params.require(:investment).permit(
      :total_multiples_invested,
      :campaign_id
    )
  end

end
