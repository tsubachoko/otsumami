class DrinksController < ApplicationController
  
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def new
    @drink = current_user.drinks.new
  end

  def create
    drink = current_user.drinks.new(drink_param)
    if drink.save
      flash[:success] = "ドリンクを投稿しました"
      redirect_to drink_path(drink)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render 'drinks/new'
    end
  end


  private

    def drink_param
      params.require(:drink).permit(:title, :content, :comment)
    end

end
