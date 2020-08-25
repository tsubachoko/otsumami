class PairingsController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :new_drink, :new_food, :create]

  def index
    @pairings = Pairing.all
  end

  def show
    @pairing = Pairing.find(params[:id])
  end

  def new_drink
    @drinks = current_user.favorite_items.where(type: 'Drink')
  end

  def new_food
    @drink = Drink.find_by(id: params[:drink_id])
    @foods = current_user.favorite_items.where(type: 'Food')
  end

  def new
    @drink = Drink.find_by(id: params[:drink_id])
    @food = Food.find_by(id: params[:food_id])
    @pairing = current_user.pairings.new
  end

  def create
    pairing = current_user.pairings.new(pairing_param)
    if pairing.save
      flash[:success] = "組み合わせを投稿しました"
      redirect_to pairing_path(pairing)
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back fallback_location: root_path
    end
  end


  private

    def pairing_param
      params.require(:pairing).permit(:title, :drink_id, :food_id, :comment)
    end

end
