class AuthorsController < ApplicationController

  def create
    author = Author.find_or_create_by!(author_params)

    # ログインユーザーのお気に入りに登録
    current_user.author_favorites.create!(author_id: author.id)
    
    to_be_favored_author_books = RakutenWebService::Books::Book.search(
    author: author.author_name,
    sorts: "-releaseDate",
    )

    favored_author_books = to_be_favored_author_books.map do |b|
      FavoredAuthorBook.new(
        author_name: author.author_name,
        isbn: b.isbn,
        title: b.title,
        sales_date: b.sales_date,
        image_url: b.medium_image_url,
        item_url: b.item_url,
        item_price: b.item_price,
        books_genre_id: b.books_genre_id,
        size: b.size
      )
    end

    FavoredAuthorBook.import favored_author_books
        
    redirect_back(fallback_location: root_path)

  end

  private

    def author_params
      params.require(:author).permit(:author_name)
  end

    def favored_author_book_params
      params.require(:favored_author_book).permit(
        :isbn,
        :title,
        :sales_date,
        :image_url,
        :item_url,
        :item_price,
        :booksgenreid,
        :size
      )
    end

end