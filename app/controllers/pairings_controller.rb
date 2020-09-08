class PairingsController < ItemsController
  
  before_action :logged_in_user, only: [:new, :new_drink, :new_food, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @pairings = Pairing.paginate(page: params[:page], per_page: 20)
  end

  def show
    @pairing = Pairing.find(params[:id])
  end

  def new_drink
    @drinks = current_user.favorite_items.where(type: 'Drink')
  end

  def new_food
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

  def destroy
    pairing = current_user.pairings.find_by(id: params[:id])
    pairing.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to root_path
  end

  private

    def pairing_param
      params.require(:pairing).permit(:title, :drink_id, :food_id, :comment)
    end

end
