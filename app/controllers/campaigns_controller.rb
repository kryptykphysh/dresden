class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.paginate(page: params[:page], limit: 10)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    if current_user
      @campaign = Campaign.new
    else
      flash[:alert] = "You must be logged in."
      redirect_to root_path
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
