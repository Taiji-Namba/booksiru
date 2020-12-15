class TitleKanasController < ApplicationController
  def create
    # ボタンを押すと作品名がfavored_booksテーブルに登録される。すでに登録されている場合は取得するだけ
    favored_book = FavoredBook.find_or_create_by!(favored_book_params)

    # ログインユーザーのお気に入り作品に登録
    book_favorite = current_user.book_favorites.create!(favored_book_id: favored_book.id)
  end

  private

  def title_kana_params
    params.require(:title_kanas).permit(:title_kana)
  end
end
