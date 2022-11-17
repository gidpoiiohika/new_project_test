class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_article, only: %i[ show update destroy ]

  def index
    @articles = Article.filtered(filter_params, current_user)
  end

  def show; end

  def create
    @article = Article.new article_params

    if @article.save
      render :show
    else
      render json: { errors: @article.errors.messages }, status: 404
    end
  end

  def update
    if @article.update article_params 
      render :show
    else
      render json: { errors: @article.errors.messages }, status: 404
    end
  end

  def destroy
    if @article.destroy
      render :show
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:cover, :title, :description, :author_id, :category_id, tags_attributes: [:name], comments_attributes: [:title, :user_id])
  end

  def filter_params
    params.permit(:per_page, :article_deleted, :title, :date)
  end
end
