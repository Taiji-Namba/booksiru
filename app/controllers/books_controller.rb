class BooksController < ApplicationController
  attr_accessor :books 
  
  def home
    @books = RakutenWebService::Books::Book.search(sort: "sales")
  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword], booksGenreId: params[:pulldown])
    end
  end
end