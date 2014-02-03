class Campaign < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :gamemaster_id, presence: true
  validates :power_level_id, presence: true

  default_scope { order(updated_at: :desc) }

  belongs_to :gamemaster, class_name: 'User'
  belongs_to :power_level
  has_many :characters
  has_many :players,  through: :characters,
                      class_name: 'User',
                      source: :played_by
end
