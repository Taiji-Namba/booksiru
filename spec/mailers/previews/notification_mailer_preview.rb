# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  def send_notification_email
    NotificationMailer.send_notification_email(User.find(1))
  end

end