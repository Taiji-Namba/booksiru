require "rakuten_web_service"

RakutenWebService.configure do |c|
  c.application_id = "1037613591072930315"
  c.affiliate_id = "1d38fc7e.12656d9f.1d38fc7f.3cca4dac"
end

books = RakutenWebService::Books::Book.search(keyword: "Ruby")
books.first(10).each do |book|
  # if book["availability"] == 1 #在庫があるか

    #取得したデータを取得
    puts "#{book.title}"
end