class AuthorFavoritesController < ApplicationController

  def index
    @author_favorites = AuthorFavorite.order(:id).includes(:user)
  end
  
  
  def create
    author_favorite = current.author_favorites.create!(author_favorite_params)
  end

  private

  def author_favorite_params
    params.require(:author_favorite).permit(:author_name)
  end
    
end