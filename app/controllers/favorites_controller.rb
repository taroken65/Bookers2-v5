class FavoritesController < ApplicationController
 before_action :authenticate_user!
 before_action :book_params

 def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
    
 end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    
  end
  
  private
  def book_params
    @book = Book.find(params[:id])
  end

end
