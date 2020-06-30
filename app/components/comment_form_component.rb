class CommentFormComponent < ViewComponent::Base
  include Motion::Component

  map_motion :save
  map_motion :validate

  def initialize(post:)
    @comment = Comment.new(post: post)
    @changed_fields = Set.new
    @disabled = !@comment.valid?
  end

  def validate(event)
    @changed_fields << event.target.data[:field].to_sym
    @comment.assign_attributes(comment_params(event.form_data))
    @disabled = !@comment.valid?
  end

  def save
    @comment = Comment.new(post: @comment.post)
    puts @comment.inspect
    @changed_fields = Set.new
    @disabled = !@comment.valid?
  end

  private

  def comment_params(params)
    params.require(:comment).permit(:name, :body)
  end
end
