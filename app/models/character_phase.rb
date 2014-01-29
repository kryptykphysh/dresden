class CharacterPhase < ActiveRecord::Base
  belongs_to :phase
  belongs_to :character
  belongs_to :aspect
  belongs_to :guest_star, class_name: 'Character'

  validates :character_id,  presence: true,
                            uniqueness: { scope: :phase_id }
  validates :phase_id, presence: true
end
