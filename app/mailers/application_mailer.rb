class ApplicationMailer < ActionMailer::Base
  default from: "ブクシル <#{Rails.application.credentials.mail[:user_name]}>"
  binding.pry
  layout 'mailer'
end