class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(post: post))

    @comment.save

    head :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
