require 'rails_helper'

RSpec.describe "FavoredAuthorBooks", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/favored_author_books/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/favored_author_books/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/favored_author_books/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
