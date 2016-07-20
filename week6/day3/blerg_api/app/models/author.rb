class Author < ApplicationRecord

  has_secure_password

  has_many :posts

  validates :auth_token, presence: true, uniqueness: true

  before_validation :generate_auth_token, on: :create


  def regenerate_auth_token
    generate_auth_token
  end

  private

  def generate_auth_token
    while auth_token.blank? || Author.exists?(auth_token: auth_token)
      self.auth_token = SecureRandom.hex(10)
    end
  end


end
