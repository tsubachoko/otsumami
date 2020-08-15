class ItemsController < ApplicationController

  def index
    @pairings = Pairing.all
    @drinks  = Drink.all
    @foods   = Food.all
  end

end
