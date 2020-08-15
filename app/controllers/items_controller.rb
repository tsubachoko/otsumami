class ItemsController < ApplicationController

  def index
    @pairings = pairing.all
    @drinks  = Drink.all
    @foods   = Food.all
  end

end
