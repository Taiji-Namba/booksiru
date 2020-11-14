class AuthorFavoritesController < ApplicationController

  def index
    @author_favorites = AuthorFavorite.order(:id).includes(:user)
  end

  def create
    current_user.author_favorites.create!(author_id: author.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    author_favorite = current_user.author_favorites.find_by(author_name: params[:author_name])
    author_favorite.destroy!
    redirect_back(fallback_location: root_path)
  end

  # private

  # def author_name
  #   params.require(:author_favorite).permit(:author_name)
  # end
    
end