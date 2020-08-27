class FavoritesController < ApplicationController
  
  before_action :logged_in_user
  
  def create
    item = Item.find(params[:item_id])
    current_user.favorite(item)
    redirect_back fallback_location: root_path
  end

  def destroy
    item = Favorite.find(params[:id]).item
    current_user.unfavorite(item)
    redirect_back fallback_location: root_path
  end

end
