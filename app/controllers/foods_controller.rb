class FoodsController < ItemsController
  
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user, only: :destroy

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

  def destroy
    food = current_user.foods.find_by(id: params[:id])
    food.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to root_path
  end


  private

    def food_param
      params.require(:food).permit(:title, :content, :comment)
    end

end
