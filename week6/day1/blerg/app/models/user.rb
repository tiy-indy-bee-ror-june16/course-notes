class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true, format: {:with => /\A(\w+)\z/}
  validates :email, uniqueness: true, format: {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

  before_save :downcase_username

  def to_param
    username
  end

  def downcase_username
    self.username = username.downcase
  end

end
