class DrinksController < ItemsController
  
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @drinks = Drink.paginate(page: params[:page], per_page: 20)
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

  def destroy
    drink = current_user.drinks.find_by(id: params[:id])
    drink.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to root_path
  end

  private

    def drink_param
      params.require(:drink).permit(:title, :content, :comment)
    end

end
