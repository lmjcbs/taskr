class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :content, length: { minimum: 10 }
end