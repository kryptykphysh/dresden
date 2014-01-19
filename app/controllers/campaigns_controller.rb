class CampaignsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @campaigns = Campaign.all.paginate(page: params[:page], limit: 10)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def campaign_params
    require(:campaign).permit(:name, :description)
  end
end
