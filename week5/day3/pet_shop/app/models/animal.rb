class Animal < ActiveRecord::Base

  belongs_to :breed

  validates :name, presence: true, length: {maximum: 120}

end
