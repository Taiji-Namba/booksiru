class AuthorsController < ApplicationController

  def create
    author = Author.new(author_params)
    author.save!

    # author_favorite = AuthorFavorite.create!(author_favorite_params)
    # author_favorite.save!
  end

  def author_params
    params.require(:author).permit(:author_name, author_favorites_attributes: [:author_id, :user_id])
  end

  # def author_favorite_params
  #   params.require(:author).permit(:author_id, :user_id)
  # end

end
