# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/comments', type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  let(:valid_attributes) do
    {
      user_id: user.id,
      title: 'test title'
    }
  end

  let(:invalid_attributes) do
    {
      user_id: user.id,
      title: '',
      article_id: article.id
    }
  end

  let(:valid_attributes_show) do
    {
      user_id: user.id,
      title: 'test title'
    }
  end

  describe 'GET /show' do
    before(:each) do
      user.confirm
      sign_in user
    end

    it 'renders a successful response' do
      comment = article.comments.create! valid_attributes_show
      get comment_url(comment), as: :json
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
      it 'creates a new Comment' do
        expect do
          post comments_url,
               params: { article_id: article.id, comment: valid_attributes }, as: :json
        end.to change(Comment, :count).by(1)
      end

      it 'renders a JSON response with the new comment' do
        post comments_url,
             params: { article_id: article.id, comment: valid_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Comment' do
        expect do
          post comments_url,
               params: invalid_attributes, as: :json
        end.to change(Comment, :count).by(0)
      end

      it 'renders a JSON response with errors for the new comment' do
        post comments_url,
             params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'GET /ratings' do
    before(:each) do
      comment = article.comments.create! valid_attributes_show
      user.confirm
      sign_in user
      get ratings_comment_url(comment), as: :json
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
end
