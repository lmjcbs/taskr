class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments

  before_action :logged_in?
end