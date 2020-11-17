class AuthorsController < ApplicationController

  def create
    author = Author.find_or_create_by!(author_params)

    # ログインユーザーのお気に入りに登録
    current_user.author_favorites.create!(author_id: author.id)
    
    # 登録した著者の未発売の書籍をFavoredAuthorBookに登録
    if ストロングパラメーターが空じゃない時
    favored_author_book = FavoredAuthorBook.find_or_create_by!(favored_author_book_params)
    end
    
    redirect_back(fallback_location: root_path)

  end

  private

    def author_params
      params.require(:author).permit(:author_name)
    end

    def favored_author_book_params
      params.require(:favored_author_book).permit(
        :author_id,
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