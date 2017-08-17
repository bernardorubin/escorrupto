class Comment < ApplicationRecord
  belongs_to :person
  has_many :threaded_comments
end
