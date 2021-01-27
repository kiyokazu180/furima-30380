class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :buy_record
  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :send_fee
  belongs_to :region
  belongs_to :wait_day
  has_one_attached :image
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :state_id
  validates :region_id
  validates :wait_day_id
  validates :send_fee_id
  end
  with_options presence: true do
  validates :image
  validates :name
  validates :exoplanation
  validates :value
  end
  validates :value, inclusion: {in: 300..9999999}
  validates :value, numericality: { only_integer: true }
end
