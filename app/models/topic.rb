class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts

  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
  end
end
