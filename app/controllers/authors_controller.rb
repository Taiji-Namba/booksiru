class AuthorsController < ApplicationController

  def create
    author = AuthorFavorite.build!(author_params)
  end

  def author_params
    params.require(:author).permit(:author_name)
  end

end
