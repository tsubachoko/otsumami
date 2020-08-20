class FoodsController < ApplicationController
  
  before_action :logged_in_user, only: [:new, :create]

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = current_user.foods.new
  end

  def create
    food = current_user.foods.new(food_param)
    if food.save
      flash[:success] = "おつまみを投稿しました"
      redirect_to food_path(food)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render 'foods/new'
    end
  end


  private

    def food_param
      params.require(:food).permit(:title, :content, :comment)
    end

end
