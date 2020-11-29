class RegistrationMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = "https://booksiru.herokuapp.com"
    mail(subject: "新規登録ありがとうございます！", to: @user.email)
  end
  
end