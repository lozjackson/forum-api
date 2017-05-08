class Post < ApplicationRecord
  resourcify
  belongs_to :topic
  belongs_to :user
end
