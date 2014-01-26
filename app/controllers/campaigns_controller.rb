class CampaignsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @campaigns = Campaign.all.includes(:gamemaster, :players).
      paginate(page: params[:page], limit: 10)
  end

  def show
    @campaign = Campaign.includes(:gamemaster, :players).find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.gamemaster = current_user
    @campaign.save

    redirect_to edit_campaign_path(@campaign)
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description, :power_level_id)
  end
end
