class Aspect < ActiveRecord::Base
  before_validation { |aspect| aspect.name = name.downcase }

  has_many :characters, through: :character_phases

  validates :name,  presence: true,
                    uniqueness: true
end
