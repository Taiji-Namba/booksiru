class BooksController < ApplicationController
  attr_accessor :books 
  
  def home
    @books = RakutenWebService::Books::Book.search(sort: "sales")
  end

  def search
    if params[:keyword].present?
      @author_books = RakutenWebService::Books::Book.search(
        author: params[:keyword],
        booksGenreId: params[:booksgenreid],
        orFlag: 0,
      )
    else
      redirect_to root_path
    end
        
    if params[:keyword].present?
      @title_books = RakutenWebService::Books::Book.search(
        title: params[:keyword],
        booksGenreId: params[:booksgenreid],
        orFlag: 0,
      )
    end
    
  end
end