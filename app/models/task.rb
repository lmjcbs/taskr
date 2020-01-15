class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
end