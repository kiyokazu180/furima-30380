class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :name_lc, :name_gc, :name_l, :name_g, :birth, presence: true
  validates :name_lc, :name_gc, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
  validates :name_l, :name_g, format: { with: /\A[ァ-ヶー－]+\z/ }
end
