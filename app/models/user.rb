class User < ApplicationRecord
  before_save { email.downcase! }
  has_secure_password
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_many :bookposts
end
