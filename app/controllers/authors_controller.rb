class AuthorsController < ApplicationController

  def create
    author = Author.find_or_create_by!(author_params)

    # ログインユーザーのお気に入りに登録
    current_user.author_favorites.create!(author_id: author.id)
    
    to_be_favored_author_books = RakutenWebService::Books::Book.search(
    author: author.author_name,
    sorts: "-releaseDate",
    availability: 5
    )

    to_be_books = []
    to_be_favored_author_books.each do |b|
      to_be_books << FavoredAuthorBook.new(
        isbn: b.isbn,
        title: b.title,
        image_url: b.medium_image_url,
        item_url: b.item_url,
        item_price: b.item_price,
        books_genre_id: b.books_genre_id,
        size: b.size
      )
    end
    FavoredAuthorBook.import(to_be_books, on_duplicate_key_update: false)
      
    # # 登録した著者の未発売の書籍をFavoredAuthorBookに登録
    # if params.has_key?(:favored_author_book)
    # favored_author_book = author.favored_author_books.find_or_create_by!(favored_author_book_params)
    # end
    
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