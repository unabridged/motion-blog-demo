class CommentFormComponent < ViewComponent::Base
  include Motion::Component

  map_motion :save
  map_motion :validate

  def initialize(post:)
    reset(post)
  end

  def validate(event)
    @changed_fields << event.target.data[:field].to_sym
    @comment.assign_attributes(comment_params(event.form_data))
    @comment.validate
  end

  def save(event)
    @comment.assign_attributes(comment_params(event.form_data))
    @comment.save
    reset(@comment.post)
  end

  private

  def reset(post)
    @comment = Comment.new(post: post)
    @changed_fields = Set.new
  end

  def comment_params(params)
    params.require(:comment).permit(:name, :body)
  end
end
