class AuthorFavoritesController < ApplicationController

  def index
    @author_favorites = AuthorFavorite.order(:id).includes(:user)
  end

  def destroy
    current_user.author_favorites.find_by(author_id: params[:author_id]).destroy!
    
    if AuthorFavorite.find_by(author_id: params[:author_id]).nil?
      author = Author.find_by(id: params[:author_id])
      author.destroy!
    end
    
    redirect_back(fallback_location: root_path)
  end
    
end