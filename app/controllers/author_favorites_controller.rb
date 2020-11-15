class AuthorFavoritesController < ApplicationController

  def index
    @author_favorites = AuthorFavorite.order(:id).includes(:user)
  end

  def destroy
    current_user.author_favorites.find_by(author_id: params[:author_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
    
end