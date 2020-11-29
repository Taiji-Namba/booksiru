class NotificationMailer < ApplicationMailer

  def send_notification_email
    @user = user
    @favored_author_book = favored_author_book
    mail(subject: "#【{@favored_author_book.title}】があと3日で発売です", to: @user.email)
  end
end