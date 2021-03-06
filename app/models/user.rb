class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :articles, dependent: :destroy

  before_save { self.email = email.downcase }

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimun: 3, maximum: 25 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX },
    length: { maximum: 105 }

  has_secure_password
end
