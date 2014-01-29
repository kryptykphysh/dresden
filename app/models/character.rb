class Character < ActiveRecord::Base
  before_validation { |character| character.name = name.downcase }
  after_create :add_character_phases

  belongs_to :high_concept, class_name: 'Aspect'
  belongs_to :trouble, class_name: 'Aspect'
  belongs_to :campaign
  belongs_to :played_by, class_name: 'User'
  has_many :character_phases
  has_many :aspects, through: :character_phases
  has_one :power_level, through: :campaign

  validates :name,  presence: true,
                    uniqueness: true
  validates :played_by, presence: true

  private

  def add_character_phases
    Phase.all.pluck(:id).each do |phase|
      CharacterPhase.create(
        phase_id: phase,
        character_id: self.id
      )
    end
  end
end
