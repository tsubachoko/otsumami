class ItemsController < ApplicationController

  def index
    @parings = Paring.all
    @drinks  = Drink.all
    @foods   = Food.all
  end

end
