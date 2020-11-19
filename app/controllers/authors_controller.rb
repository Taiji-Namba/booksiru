class AuthorsController < ApplicationController

  def create
    # ボタンを押すと著者(author)がauthorsテーブルに登録される。すでに登録されている場合はauthorを取得するだけ
    author = Author.find_or_create_by!(author_params)

    # ログインユーザーのお気に入りに登録
    current_user.author_favorites.create!(author_id: author.id)
    
    #お気に入り登録した著者の本を取得
    to_be_favored_author_books = RakutenWebService::Books::Book.search(
    author: author.author_name,
    sorts: "-releaseDate",
    )

    # 未発売の本だけfavored_author_booksテーブルに各種情報を登録
    favored_author_books = to_be_favored_author_books.select{|tob| tob.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i > Time.current.strftime("%Y%m%d").to_i}.map do |b|
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

end