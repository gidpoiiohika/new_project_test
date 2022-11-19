require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:user) { create(:user)}

  let(:new_attributes) {
    { first_name: 'dasdasd' }
  }

  let(:new_attributes_invalid_attributes) {
    { last_name: '' }
  }

  describe "GET /show" do
    before(:each) do
      user.confirm
      sign_in user
      get user_url(user), as: :json
    end

    it "renders a successful response" do
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end

  describe "PATCH /update" do
    before(:each) do
      user.confirm
      sign_in user
    end

    context "with valid parameters" do
      it "updates the requested user" do
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        user.reload
      end

      it "renders a JSON response with the user" do
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the user" do
        patch user_url(user), params: { user: new_attributes_invalid_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
