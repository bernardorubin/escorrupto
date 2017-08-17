class MainComment < ApplicationRecord
  belongs_to :target
  has_many :threaded_comments
end
