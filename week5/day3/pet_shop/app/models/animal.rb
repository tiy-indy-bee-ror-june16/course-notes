class Animal < ActiveRecord::Base

  belongs_to :breed

  validates :name, presence: true, length: {maximum: 120}
  validates :breed, presence: {message: "ID is not an ID associated in our system"}

end
