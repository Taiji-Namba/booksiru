class TitleKanasController < ApplicationController
  def create
    # ボタンを押すとその作品のカナがtitle_kanaテーブルに登録される。すでに登録されている場合は取得するだけ
    title_kana = TitleKana.find_or_create_by!(title_kana_params)

    # ログインユーザーのお気に入り作品に登録
  #   book_favorite = current_user.book_favorites.create!(title_kana_id: title_kana.id)
  # end

private

  def title_kana_params
    params.require(:title_kana).permit(:title_kana)
  end
end
