class Address < ApplicationRecord
  # attr_accessor :token
  belongs_to :buy_record
  belongs_to :region
  # with_options presence: true do
  #   validates :token
  # end  
end
