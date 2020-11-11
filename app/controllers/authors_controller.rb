class AuthorsController < ApplicationController

  def create
    @author = Author.build!(author_params)
    @author.save!

    @author_favorite = AuthorFavorite.build!(author_favorite_params)
    @author_favorite.save!
  end

  def author_params
    params.require(:author).permit(:author_name)
  end

  def author_favorite_params
    params.require(:author).permit(:author_id, :user_id)
  end

end
