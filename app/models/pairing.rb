class Pairing < Item
  validates :content, absence: true
  validates :drink_id, presence: true
  validates :food_id, presence: true

  # drink_idとfood_idの組み合わせを一意にする
  validates_uniqueness_of :drink_id, scope: :food_id

  
  def drink
    Drink.find_by(id: self.drink_id)
  end

  def food
    Food.find_by(id: self.food_id)
  end

  def set_drink(drink)
    if drink.nil?
      self.drink_id = nil
    else
      self.drink_id = drink.id
    end
  end

  def set_food(food)
    if food.nil?
      self.food_id = nil
    else
      self.food_id = food.id
    end
  end

end