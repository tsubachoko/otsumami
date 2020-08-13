class Paring < Item
  validates :content, absence: true
  validates :drink_id, presence: true
  validates :food_id, presence: true

  # drink_idとfood_idの組み合わせを一意にする
  validates_uniqueness_of :drink_id, scope: :food_id

  
end