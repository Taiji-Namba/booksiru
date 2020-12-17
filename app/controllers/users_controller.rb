class UsersController < ApplicationController
  def favorite
    @favored_books = current_user.notice_favored_books
    @favored_authors = current_user.favored_authors
  end
end