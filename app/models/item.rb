class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :type, presence: true # サブクラスの名称に限定したい
  validates :title, presence: true, length: { maximum: 20 }
end
