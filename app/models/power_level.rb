class PowerLevel < ActiveRecord::Base
  validates :name,          presence: true
  validates :refresh,       presence: true
  validates :skill_points,  presence: true
  validates :skill_cap_id,  presence: true

  belongs_to :skill_cap, class_name: 'SkillLevel'
  has_many   :campaigns
end
