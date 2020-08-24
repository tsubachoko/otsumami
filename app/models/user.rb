class User < ApplicationRecord

  before_save :downcase_email

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGIX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: VALID_EMAIL_REGIX },
                    uniqueness: { case_sensitive: true }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  has_many :items, dependent: :destroy
  has_many :drinks, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :pairings, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    def downcase_email
      self.email.downcase!
    end


end
