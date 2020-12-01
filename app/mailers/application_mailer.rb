class ApplicationMailer < ActionMailer::Base
  default from: "ブクシル <#{Rails.application.credentials.mail[:user_name]}>"
  layout 'mailer'
end