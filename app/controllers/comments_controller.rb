class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: %i[ show update ratings ]

  def show; end

  def create
    commentable = Article.find(params[:article_id])
    @comment = commentable.comments.build comment_params

    if @comment.save
      render :show
    else
      render json: { errors: @comment.errors.messages }, status: :unprocessable_entity
    end
  end

  def ratings
    count_rating = @comment.rating + 1
    @comment.rating = count_rating
    if @comment.save
      render :show
    else
      render json: { errors: @comment.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :user_id, :rating)
  end
end
