class NotificationMailer < ApplicationMailer

  def send_notification_email(user)
    @user = user
    mail(subject: "あと3日で発売です", to: @user.email)
  end
end