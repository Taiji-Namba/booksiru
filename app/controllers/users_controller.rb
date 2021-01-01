class UsersController < ApplicationController
  def favorite
    @favored_book = current_user.notice_favored_books.first
    @favored_authors = current_user.favored_authors
  end
end