class PairingsController < ApplicationController
  
  def index
    @pairings = Pairing.all
  end

  def show
    @pairing = Pairing.find(params[:id])
  end

end
