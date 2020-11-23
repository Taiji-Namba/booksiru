namespace :notice_book do
  desc "発売日3日前の本をnoticesテーブルに登録するタスク"
  task create_notice: :environment do
    notice_books = FavoredAuthorBook.where(days_to_release: 0...4)
    notice_books.each do |b|
    current_user.notices.create!(favored_author_book_id: b.id)
    end
  end
end