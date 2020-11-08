class FavoredAuthorBooksController < ApplicationController
  def create
    
    favored_author_books = RakutenWebService::Books::Book.search(
      author: params[:author_name] # このauthor_nameはauthor_favorite_idごとのauthor_name。わからないがparamsで受け取れる？
    )

    favored_author_books.each do |book|
      "author_favorite_idがauthor_favorites#createで登録されたauthor_favorite.idのAuthorFavoriteインスタンス".favored_author_books.create!(
        isbn: book.isbn,
        title: book.title,
        略
      )
      favored_author_book = FavoredAuthorBook.find(params[:favored_author_book_id])
    end
  
  end

  def show
  end

  def destroy
  end
end
