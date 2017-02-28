class User < ApplicationRecord
  has_secure_password

  validates :fn, :ln, :city, :state, presence: true, length: { in: 2..20 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
j