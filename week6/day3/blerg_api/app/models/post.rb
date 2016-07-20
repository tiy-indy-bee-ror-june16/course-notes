class Post < ApplicationRecord

  belongs_to :author
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true

end
