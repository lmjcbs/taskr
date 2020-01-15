module CommentHelper
  def has_comments(resource)
    !resource.comments.empty?
  end

  def display_comments(resource)
    resource.comments.reverse.each do |comment|
      concat render partial: 'comments/comment', locals: {comment: comment}
    end
  end
end