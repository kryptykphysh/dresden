class Campaign < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :gamemaster_id, presence: true

  default_scope { order(updated_at: :desc) }

  belongs_to :gamemaster, class_name: 'User'
end
