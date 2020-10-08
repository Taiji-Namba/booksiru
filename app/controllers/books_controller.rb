class BooksController < ApplicationController
  attr_accessor :books 
  
  def top
    books = RakutenWebService::Books::Book.search(title: "Ruby")
    books.first(10).each do |book|
      # if book["availability"] == 1 #在庫があるか

      #取得したデータを取得
      puts book.title
    end
  end

  def show

  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(keyword: params[:keyword])
    end
    # books = RakutenWebService::Books::Book.search(keyword: "Ruby")
    # items.page(3).all do |item|
    # puts item.name

    # @books = Book.search(params[:book])
  end
end
