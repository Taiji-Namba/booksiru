require 'rails_helper'

RSpec.describe "BooksOfTheAuthors", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/books_of_the_authors/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/books_of_the_authors/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
