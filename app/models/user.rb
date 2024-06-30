# User represents the model for users in the system.
# It contains validations for username and email fields.
class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles
  # Username validations
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }

  # Define the email validation regex constant
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Email validations
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 }
  has_secure_password
end
