class CommentListComponent < ViewComponent::Base
  include Motion::Component

  def initialize(post:)
    @comments = post.comments.order(created_at: :desc).to_a
    stream_for [post, :new_comment], :handle_created
  end

  def handle_created(comment_id)
    @comments.unshift(Comment.find(comment_id))
  end
end
