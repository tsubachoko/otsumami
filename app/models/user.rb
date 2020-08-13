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
  has_many :parings, dependent: :destroy

  private

    def downcase_email
      self.email.downcase!
    end


end
