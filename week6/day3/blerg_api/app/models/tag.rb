class Tag < ApplicationRecord

  has_many :taggings
  has_many :posts, through: :taggings

  validates :name, uniqueness: true, presence: true

  before_validation :sanitize_name

  def self.sanitizer(possible_name)
    possible_name.downcase.gsub(/\.|-|\s/, "_")
  end

  def sanitize_name
    self.name = self.class.sanitizer(name)
  end


end
