require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:user) { create(:user)}

  describe "GET /index" do
    before(:each) do
      user.confirm
      sign_in user
      get categories_url, as: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
