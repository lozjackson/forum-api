class PostSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :topic
  belongs_to :user
end
