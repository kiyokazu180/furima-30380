class Address < ApplicationRecord
  belongs_to :region
  with_options numericality: { other_than: 1 } do
    validates :region_id
  end
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :area
    validates :phone_number
  end  
end
