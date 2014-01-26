class SkillLevel < ActiveRecord::Base
  validates :name,      presence: true
  validates :modifier,  presence: true

  has_many :power_levels, class_name: 'PowerLevel',
                          foreign_key: 'skill_cap_id'

  default_scope { order(modifier: :asc) }
end
