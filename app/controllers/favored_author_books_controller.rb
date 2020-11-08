class FavoredAuthorBooksController < ApplicationController
  def create
    favored_author_books = RakutenWebService::Books::Book.search(
      author: params[:author_name]
    )

    favored_author_books.each do |b|
      b.create!(
        isbn: params[:isbn]
      )
      
      
      
      author_favorite = current_user.author_favorites.create!(author_name: params[:author_name])
    end
  end

  def show
  end

  def destroy
  end
end
