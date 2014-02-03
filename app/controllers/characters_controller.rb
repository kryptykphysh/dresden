class CharactersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @characters = Character.all.
      paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
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