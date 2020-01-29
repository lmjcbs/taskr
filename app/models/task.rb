class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, :due_date, presence: :true
  validates :description, length: { minimum: 15 }

  scope :search_by_title, -> (search_term) {where("title LIKE ?", search_term)}
end