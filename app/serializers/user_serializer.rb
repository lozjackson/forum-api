class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :disabled, :email
  has_many :topics
  has_many :posts
end
