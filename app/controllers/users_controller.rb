class UsersController < ApplicationController
  def show
    @user = User.includes(:characters,
                          :played_campaigns,
                          :gamemastered_campaigns).
                  find(params[:id])
  end
end