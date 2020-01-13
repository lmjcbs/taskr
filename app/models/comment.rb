class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  before_action :logged_in?
end