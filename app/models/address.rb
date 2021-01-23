class Address < ApplicationRecord
  attr_accessor :token
  belongs_to :buy_record
  belongs_to :region
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :phone_number, format: {with: /\A\d{10,11}\z/}
  with_options numericality: { other_than: 1 } do
    validates :region_id
  end
  with_options presence: true do
    validates :token
    validates :postal_code
    validates :city
    validates :area
    validates :phone_number
  end  
end
