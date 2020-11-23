# def get_waiting_books
#   to_be_noticed = FavoredAuthorBook.where(sales_date: "2020年12月28日")
# end


# namespace :notice_book do
#   desc "発売日3日前の本をnoticesテーブルに登録するタスク"
#   task create_notice: :environment do
#   発売日が3日以内の本をnoticesに登録する処理
#   end
# end

# # noticesにuser_idとfavored_author_book_idを持つレコードを登録
#   favored_author_books.each do |book|
#     current_user.notices.create!(favored_author_book_id: book.id)
#   end