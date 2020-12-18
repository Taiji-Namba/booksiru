class BooksController < ApplicationController
  attr_accessor :books 
  
  def home
    books = RakutenWebService::Books::Book.search(
      sort: "standard",
      booksGenreId: "001001"
    )
    @unreleased_books = books.select{|book| book.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i > Time.current.strftime("%Y%m%d").to_i}
      # rational_type_days_to_release = Date.parse(b.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01")) - Date.today rescue 0
    # end
    # @unreleased_books = unreleased_books.sort()
  end

  def search
    if params[:keyword].present?
      @author_books = RakutenWebService::Books::Book.search(
        author: params[:keyword],
        booksGenreId: params[:booksgenreid],
        orFlag: 0,
        sort: "standard",
      )
    else
      redirect_to root_path
    end
        
    if params[:keyword].present?
      @title_books = RakutenWebService::Books::Book.search(
        title: params[:keyword],
        booksGenreId: params[:booksgenreid],
        orFlag: 0,
        sort: "standard",
      )
    end
  end
end