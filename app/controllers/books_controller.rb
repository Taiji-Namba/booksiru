class BooksController < ApplicationController
  attr_accessor :books 
  
  def home
    comics = RakutenWebService::Books::Book.search(
      booksGenreId: Genre.find_by(genre: "コミック").booksgenreid,
      sort: "standard"
    )
    @unreleased_comics = comics.select{|book| book.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i > Time.current.strftime("%Y%m%d").to_i}
    
    light_novels = RakutenWebService::Books::Book.search(
      booksGenreId: Genre.find_by(genre: "ライトノベル").booksgenreid,
      sort: "standard"
    )
    @unreleased_light_novels = light_novels.select{|book| book.sales_date.delete("/年|月|日|頃|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i > Time.current.strftime("%Y%m%d").to_i}

    novels_and_essays = RakutenWebService::Books::Book.search(
      booksGenreId: Genre.find_by(genre: "小説・エッセイ").booksgenreid,
      sort: "standard"
    )
    @unreleased_novels_and_essays = novels_and_essays.select{|book| book.sales_date.delete("/年|月|日|頃| |　|/").gsub(/|上旬|中旬|下旬|以降/, "上旬" => "5", "中旬" => "15", "下旬" => "25", "以降" => "01").to_i > Time.current.strftime("%Y%m%d").to_i}
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