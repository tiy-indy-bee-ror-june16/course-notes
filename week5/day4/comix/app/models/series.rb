class Series < ActiveRecord::Base

  belongs_to :publisher

  validates :name, presence: true
  validates :publisher, presence: true

end
