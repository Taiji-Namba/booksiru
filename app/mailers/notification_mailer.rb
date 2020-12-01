class NotificationMailer < ApplicationMailer

  def send_notification_email(user)
    @user = user
    @notice_books = FavoredAuthorBook.left_joins(:notices).where(days_to_release: 0..3, notices: {user_id: @user.id, notice_flag: 0})
    
    @notice_books.each do |book|
      @author_name = book.author_name
      @title = book.title
      @isbn = book.isbn
      @sales_date = book.sales_date
      @image_url = book.image_url
      @item_price = book.item_price
      @books_genre_id = book.books_genre_id
      @size = book.size

      mail(subject: "【#{@title}】発売まであと3日！", to: @user.email)
    end
  end
end