require 'rails_helper'

RSpec.describe "Users::Profiles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      user = User.create!(
        username: "testuser",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password")
      sign_in(user)

      get "/users/profiles/show"

      expect(response).to have_http_status(:success)
    end
  end
end
