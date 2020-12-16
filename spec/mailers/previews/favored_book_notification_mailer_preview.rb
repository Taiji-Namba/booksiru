# Preview all emails at http://localhost:3000/rails/mailers/favored_book_notification_mailer
class FavoredBookNotificationMailerPreview < ActionMailer::Preview

  def send_favored_book_notification_email
    FavoredBookNotificationMailer.send_notification_email(User.find(1))
  end

end
