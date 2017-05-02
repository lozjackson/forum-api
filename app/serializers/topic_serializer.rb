class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  belongs_to :user
  has_many :posts
end
