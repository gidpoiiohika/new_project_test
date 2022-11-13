class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :user_id)
  end
end
