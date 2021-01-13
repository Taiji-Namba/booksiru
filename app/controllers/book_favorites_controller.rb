class BookFavoritesController < ApplicationController
  def index
  end

  def destroy
    current_user.book_favorites.find_by(title_kana_id: params[:title_kana_id]).destroy!

    if BookFavorite.find_by(title_kana_id: params[:title_kana_id]).nil?
      title_kana = TitleKana.find_by(id: params[:title_kana_id])
      favored_books = FavoredBook.where(title_kana: title_kana.title_kana)
      
      title_kana.destroy!
      favored_books.destroy_all
    end

    flash[:warning] = "お気に入り解除しました！"
    redirect_back(fallback_location: root_path)
  end

end