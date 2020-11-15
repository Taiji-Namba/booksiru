class AuthorsController < ApplicationController

  def create
    author = Author.find_or_create_by!(author_params)
    current_user.author_favorites.create!(author_id: author.id)
    redirect_back(fallback_location: root_path)
  end

  private

    def author_params
      params.require(:author).permit(:author_name)
    end

end