class StaticPagesController < ApplicationController
  def home
    Rails.logger.info current_user.inspect
  end
end