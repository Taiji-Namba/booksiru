class AuthorFavoritesController < ApplicationController

  def index
    @author_favorites = AuthorFavorite.order(:id).includes(:user)
  end



  private

  # def author_name
  #   params.require(:author_favorite).permit(:author_name)
  # end
    
end