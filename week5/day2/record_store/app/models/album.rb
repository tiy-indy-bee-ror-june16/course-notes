class Album < ActiveRecord::Base

  belongs_to :artist

  validates :title, presence: true, length: {minimum: 3}
  validates_presence_of :artist

end
