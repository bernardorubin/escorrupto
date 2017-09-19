class Target < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  # scope :order_by_likes, ->{order("likes")}
  scope :latest_first, -> {order(created_at: :desc)}

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end
end
