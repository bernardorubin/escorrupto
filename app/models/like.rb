class Like < ApplicationRecord
  belongs_to :user
  belongs_to :target
  validates :target_id, uniqueness: {scope: :user_id}
end
