class Food < Item

  # 対象のdrink削除に失敗した時のために、afterで実施する
  after_destroy :destroy_dependent_pairing

  validates :content, presence: true, length: { maximum: 150 }
  validates :drink_id, absence: true
  validates :food_id, absence: true

  has_many :pairings

  private

    def destroy_dependent_pairing
      # 削除するdrinkに関連したpairingを一緒に削除する
      pairings = Pairing.where(food_id: id).destroy_all
    end
end