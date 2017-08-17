class Target < ApplicationRecord
  has_many :main_comments
  scope :latest_first, -> {order(created_at: :desc)}
end
