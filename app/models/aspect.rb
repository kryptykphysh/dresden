class Aspect < ActiveRecord::Base
  before_validation { |aspect| aspect.name = name.downcase }

  has_many :characters, through: :character_phases

  validates :name,  :name_is_unique,
                    presence: true

  default_scope { order(name: :asc) }

  def name
    read_attribute(:name).try(:titleize)
  end

  private

  def name_is_unique
    Aspect.where("name = \"#{self.name.downcase}\"").count == 0
  end
end
