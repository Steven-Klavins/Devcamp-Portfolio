class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id
  
  belongs_to :topic
  has_many :comments, dependent: :destroy
  scope :most_recent_first, -> {order(created_at: :DESC)}
end
