# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/articles', type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  let(:valid_attributes) do
    {
      title: 'test title',
      description: 'test description',
      author_id: user.id,
      category_id: create(:category).id
    }
  end

  let(:invalid_attributes) do
    {
      title: 'test title',
      description: 'test description',
      author_id: create(:user).id
    }
  end

  describe 'GET /index' do
    before(:each) do
      user.confirm
      sign_in user
      get articles_url, as: :json
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'returns all articles' do
      FactoryBot.create_list(:article, 10)
      expect(JSON.parse(response.body)['articles'].size).to eq(10)
    end
  end

  describe 'GET /show' do
    before(:each) do
      user.confirm
      sign_in user
      get article_url(article), as: :json
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end

  describe 'POST /create' do
    before(:each) do
      user.confirm
      sign_in user
    end

    context 'with valid parameters' do
      it 'creates a new Article' do
        expect do
          post articles_url, params: { article: valid_attributes }, as: :json
        end.to change(Article, :count).by(1)
      end

      it 'renders a JSON response with the new article' do
        post articles_url,
             params: { article: valid_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Article' do
        expect do
          post articles_url,
               params: { article: invalid_attributes }, as: :json
        end.to change(Article, :count).by(0)
      end

      it 'renders a JSON response with errors for the new article' do
        post articles_url,
             params: { article: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    let(:new_attributes) do
      { title: 'dasdasd' }
    end

    let(:new_attributes_invalid_attributes) do
      { title: '' }
    end

    before(:each) do
      user.confirm
      sign_in user
    end

    context 'with valid parameters' do
      it 'updates the requested article' do
        patch article_url(article),
              params: { article: new_attributes }, as: :json
        article.reload
      end

      it 'renders a JSON response with the article' do
        patch article_url(article),
              params: { article: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the article' do
        article = Article.create! valid_attributes
        patch article_url(article),
              params: { article: new_attributes_invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    before(:each) do
      user.confirm
      sign_in user
    end
    it 'destroys the requested article' do
      delete article_url(article), as: :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end

  describe 'GET /rollback' do
    before(:each) do
      user.confirm
      sign_in user
      get rollback_article_url(article), as: :json
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end

  describe 'GET /rollback' do
    before(:each) do
      user.confirm
      sign_in user
      get versions_article_url(article), as: :json
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
end
