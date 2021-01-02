require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = ENV["RAILS_ENV"] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every 1.day, at: "3:00 pm" do
  rake "notice_book:update_days"
  rake "notice_book:send_notification_email"
  rake "notice_book:send_favored_book_notification_email"
end