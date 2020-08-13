class ParingsController < ApplicationController
  def index
    @parings = Paring.all
  end
end
