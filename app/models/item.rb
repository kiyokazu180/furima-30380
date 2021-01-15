class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :state
  belongs_to :send_fee
  belongs_to :region
  belongs_to :wait_day
  has_one_attached :image
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :wait_day_id, numericality: { other_than: 1 }
  validates :send_fee_id, numericality: { other_than: 1 }
  validates :string, :text, presence: true
  validates :value, inclusion: {in: 300..9999999}
  validates :value, format: { with: /\A[0-9]+\z/ }
end
