class Drink < Item

  # 対象のdrink削除に失敗した時のために、afterで実施する
  after_destroy :destroy_dependent_paring

  validates :content, presence: true, length: { maximum: 150 }
  validates :drink_id, absence: true
  validates :food_id, absence: true

  
  private

    def destroy_dependent_paring
      # 削除するdrinkに関連したparingを一緒に削除する
      parings = Paring.where(drink_id: id).destroy_all
    end

end