class AuthorsController < ApplicationController
  def create
    author = Author.create(author_params)
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end
    
end