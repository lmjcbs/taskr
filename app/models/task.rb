class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.search(search_term)
    where("title LIKE ?", "%#{search_term}%")
  end
end