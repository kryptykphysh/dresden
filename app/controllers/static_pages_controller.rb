class StaticPagesController < ApplicationController
  def home
    flash[:alert] = 'Page loaded!'
  end
end