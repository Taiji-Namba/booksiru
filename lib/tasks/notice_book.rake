namespace :notice_book do
  desc "本の発売日までの日数を更新するタスク"
  task update_days: :environment do
    FavoredAuthorBook.where(days_to_release: 0...200).each do |t|
      t.update_attribute :days_to_release, t.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i - Time.current.strftime("%Y%m%d").to_i
    end
  end
end