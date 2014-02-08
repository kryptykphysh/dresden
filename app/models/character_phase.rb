class CharacterPhase < ActiveRecord::Base
  belongs_to :phase
  belongs_to :character, inverse_of: :character_phases
  belongs_to :aspect
  belongs_to :guest_star, class_name: 'Character'

  validates :character_id, uniqueness: { scope: :phase_id }
  validates_presence_of :character
  validates_presence_of :phase
end
