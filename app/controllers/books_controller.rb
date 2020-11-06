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

      # @author_books.each do |book|
      #   @author_favorite = current_user.author_favorites.find_by(author_name: book.author)
      # end

    else
      redirect_to root_path
    end
        
    if params[:keyword].present?
      @title_books = RakutenWebService::Books::Book.search(
        title: params[:keyword],
        booksGenreId: params[:booksgenreid],
        orFlag: 0,
      )
      # @author_books.each do |book|
      #   @author_favorite = current_user.author_favorites.find_by(author_name: book.author)
      # end
    end

  end
end