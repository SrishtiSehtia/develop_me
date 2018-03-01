class User < ApplicationRecord
  validates :email, presense: true, uniqueness: true
  has_secure_password
end
