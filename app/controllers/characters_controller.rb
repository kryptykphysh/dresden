class CharactersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @characters = Character.all.
      paginate(page: params[:page], per_page: 10).
      includes( :campaign,
                :character_phases,
                :power_level,
                :played_by,
                { character_phases: :phase }
              )
  end

  def show
    @character = Character.
      includes( :campaign,
                :character_phases,
                :power_level,
                :played_by,
                { character_phases: :phase }
              ).find(params[:id])
  end

  def new
    @character = Character.new
    Phase.all.pluck(:id).each do |phase_id|
      @character.character_phases.find_or_initialize_by(phase_id: phase_id)
    end
    @character.character_phases.each { |cp| Rails.logger.info { p cp } }
  end

  def create
    if current_user
      @character = Character.new(character_params)
      @character.played_by = current_user

      if @character.valid?
        @character.save

        redirect_to character_path(@character)
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      :description,
      :high_concept_id,
      :trouble_id,
      :campaign_id,
      character_phases_attributes: [
        :character_id,
        :phase_id,
        :content,
        :aspect_id
      ]
    )
  end
end
