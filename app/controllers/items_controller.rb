class ItemsController < ApplicationController

  def index
    @pairings = Pairing.first(8)
    @drinks  = Drink.first(8)
    @foods   = Food.first(8)
  end


  private
    def correct_user
      item = current_user.items.find_by(id: params[:id])
      redirect_to root_path if item.nil?
    end

end
