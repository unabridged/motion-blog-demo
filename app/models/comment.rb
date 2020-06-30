class Comment < ApplicationRecord
  belongs_to :post

  validates :name, :body, presence: true

  after_commit :broadcast_created, on: :create

  def broadcast_created
    CommentListComponent.broadcast_to([post, :new_comment], id)
  end
end
