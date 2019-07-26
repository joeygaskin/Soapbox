class User < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :email, :username, presence: true, uniqueness: true

  has_one_attached :avatar

  def to_param
      username
  end

end
