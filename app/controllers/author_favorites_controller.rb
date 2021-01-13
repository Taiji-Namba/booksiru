class AuthorFavoritesController < ApplicationController

  def index
    @author_favorites = AuthorFavorite.order(:id).includes(:user)
  end

  def destroy
    current_user.author_favorites.find_by(author_id: params[:author_id]).destroy!
    
    if AuthorFavorite.find_by(author_id: params[:author_id]).nil?
      author = Author.find_by(id: params[:author_id])
      favored_author_books = FavoredAuthorBook.where(author_name: author.author_name)
      
      author.destroy!
      favored_author_books.destroy_all
    end

    flash[:warning] = "お気に入り解除しました！"
    redirect_back(fallback_location: root_path)
  end
    
end