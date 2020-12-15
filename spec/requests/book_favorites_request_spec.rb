require 'rails_helper'

RSpec.describe "BookFavorites", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/book_favorites/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/book_favorites/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
