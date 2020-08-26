class ItemsController < ApplicationController

  def index
    @pairings = Pairing.all
    @drinks  = Drink.all
    @foods   = Food.all
  end


  private
    def correct_user
      item = current_user.items.find_by(id: params[:id])
      redirect_to root_path if item.nil?
    end

end
