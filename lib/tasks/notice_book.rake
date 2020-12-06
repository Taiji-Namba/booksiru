namespace :notice_book do
  logger = Logger.new "log/notice_book.log"
  
  desc "本の発売日までの日数を更新"
  task update_days: :environment do
    FavoredAuthorBook.all.each do |t|
      rational_type_days_to_release = Date.parse(t.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01")) - Date.today
      
      t.update_attribute :days_to_release, rational_type_days_to_release.to_i
    end
  end

  desc "発売日が3日以内で未通知の本を通知"
  task send_notification_email: :environment do
    users = User.left_joins(notices: :favored_author_book).where(notices: {notice_flag: 0}, favored_author_books: {days_to_release: 0..3})

    users.each do |user|
      NotificationMailer.send_notification_email(user).deliver_now
      notices = Notice.left_joins(:user).where(users: {id: user.id})
      notices.each { |notice| notice.update(notice_flag: 1) }
    end
  end
end