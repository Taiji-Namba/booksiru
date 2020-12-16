class FavoredBookNotificationMailer < ApplicationMailer
  def send_favored_book_notification_email(user)
    @user = user
    @notice_books = FavoredBook.left_joins(:book_notices).where(days_to_release: 0..3, book_notices: {user_id: @user.id, notice_flag: 0})
    
    @notice_books.each do |book|
      @author_name = book.author_name
      @title = book.title
      @isbn = book.isbn
      @sales_date = book.sales_date
      @days_to_release = book.days_to_release
      @publisher_name = book.publisher_name
      @item_url = book.item_url
      @item_price = book.item_price
      @size = book.size

      mail(subject: "【#{@author_name}:#{@title}】発売まであと#{@days_to_release}日です", to: @user.email)
    end
  end
end
