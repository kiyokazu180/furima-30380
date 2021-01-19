class User < ApplicationRecord
  has_many :buy_records
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :name_lc, :name_gc, :name_l, :name_g, :birth, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :email,    uniqueness: true
  validates :name_lc, :name_gc, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :name_l, :name_g, format: { with: /\A[ァ-ヶー－]+\z/ }
end
