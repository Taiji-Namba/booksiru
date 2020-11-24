namespace :notice_book do
  desc "本の発売日までの日数を更新"
  logger = Logger.new "log/notice_book.log"

  task update_days: :environment do
    FavoredAuthorBook.all.each do |t|
      t.update_attribute :days_to_release, t.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i - Time.current.strftime("%Y%m%d").to_i
    end
  end
end