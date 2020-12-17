class TitleKanasController < ApplicationController
  def create
    # ボタンを押すとその作品のカナがtitle_kanaテーブルに登録される。すでに登録されている場合は取得するだけ
    title_kana = TitleKana.find_or_create_by!(title_kana_params)

    # ログインユーザーのお気に入り作品カナに登録
    book_favorite = current_user.book_favorites.create!(title_kana_id: title_kana.id)

    #お気に入り登録した作品カナの本を取得
    pre_favored_books = RakutenWebService::Books::Book.search(
      title_kana: title_kana.title_kana,
      author: title_kana.author_name,
      booksGenreId: "001",
      orFlag: 0,
      sort: "-releaseDate"
    )

    to_be_favored_books = pre_favored_books.select{|pfb| pfb.title_kana == title_kana.title_kana && pfb.author.delete("/ |　/") == title_kana.author_name}

    # favored_booksテーブルに各種情報を登録
    favored_books = to_be_favored_books.map do |b|
      rational_type_days_to_release = Date.parse(b.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01")) - Date.today rescue 0
      
      FavoredBook.new(
        author_name: b.author,
        isbn: b.isbn,
        title: b.title,
        title_kana: b.title_kana,
        sales_date: b.sales_date,
        days_to_release: rational_type_days_to_release.to_i,
        publisher_name: b.publisher_name,
        item_url: b.item_url,
        item_price: b.item_price,
        size: b.size
      )
    end
    
    FavoredBook.import favored_books, on_duplicate_key_update: {conflict_target: [:isbn]}

    # book_noticesテーブルにcurrent_user.idとfavored_book_idを登録
    favored_books.each do |b|
      current_user.book_notices.create!(favored_book_id: b.id)
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def title_kana_params
    params.require(:title_kana).permit(:title_kana, :author_name)
  end
end
