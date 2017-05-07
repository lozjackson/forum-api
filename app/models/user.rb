class User < ApplicationRecord
  rolify
  has_secure_password
  has_many :topics
  has_many :posts
  # has_many :roles
end
