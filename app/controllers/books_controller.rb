class BooksController < ApplicationController
  attr_accessor :books 
  
  def home
    @books = RakutenWebService::Books::Book.search(sort: "sales")
  end

  def show

  end

  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    # books = RakutenWebService::Books::Book.search(keyword: "Ruby")
    # items.page(3).all do |item|
    # puts item.name

    # @books = Book.search(params[:book])

    end
  end
end
