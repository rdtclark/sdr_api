class Api::V1::CampaignsController < ApplicationController
  before_action :set_default_format

  def index
    @campaigns = Campaign.includes(:investments).order(:name).page params[:page]
  end

  private

  def set_default_format
    request.format = :json
  end

end
