# frozen_string_literal: true

class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_article, only: %i[show update destroy version rollback]

  def index
    @articles = Article.filtered(filter_params, current_user)
  end

  def show; end

  def create
    @article = Article.new article_params

    if @article.save
      render :show
    else
      render json: { errors: @article.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    if @article.update article_params
      render :show
    else
      render json: { errors: @article.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @article.destroy

    render :show
  end

  def rollback
    version_ids = @article.versions.limit(5).reverse.pluck(:id)

    if version_ids.include? params[:version_id].to_i
      Articles::RollbackService.call(@article, params)
      render :show
    else
      render json: {
        status: { status: :unprocessable_entity, message: 'Something went wrong' }
      }
    end
  end

  def versions
    @versions = @article.versions
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:cover, :title, :description, :author_id, :category_id, tags_attributes: [:name],
                                                                                            comments_attributes: %i[title user_id])
  end

  def filter_params
    params.permit(:per_page, :article_deleted, :title, :date)
  end
end
