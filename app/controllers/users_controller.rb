class UsersController < ApplicationController
  def favorite
    @favored_books = current_user.notice_favored_books
  end
end