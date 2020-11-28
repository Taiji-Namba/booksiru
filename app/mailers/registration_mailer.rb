class RegistrationMailer < ApplicationMailer
  default from: "booksiru164@gmail.com"

  def welcome_email
    @user = params[:user]
    @url = "https://booksiru.herokuapp.com"
    mail(subject: "新規登録ありがとうございます！", to: @user.email)
  end
end