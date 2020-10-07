class Api::V1::BooksController < ApplicationController
  
  def search
  books = RakutenWebService::Books::Book.search(keyword: "Ruby")
  items.page(3).all do |item|
  puts item.name
  end
  
end
