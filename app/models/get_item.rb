class GetItem
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :area, :building, :phone_number, :user_id, :item_id, :token

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :phone_number, format: {with: /\A\d{10,11}\z/}
  with_options numericality: { other_than: 1 } do
    validates :region_id
  end
  with_options presence: true do
    validates :token
    validates :region_id
    validates :postal_code
    validates :city
    validates :area
    validates :phone_number
  end
  
  def save
    Address.create(postal_code: postal_code, region_id: region_id, city: city, area: area, building: building, phone_number: phone_number)
    BuyRecord.create(user_id: user_id, item_id: item_id)
  end

end