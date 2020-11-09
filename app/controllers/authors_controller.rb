class AuthorsController < ApplicationController

  def create
    author = current_user.author_favorites.create!(author_name: params[:author_name])
  end

end
