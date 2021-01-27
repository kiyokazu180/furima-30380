class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string        :postal_code,       null: false
      t.integer       :region_id,         null: false
      t.string        :city,              null: false
      t.string        :area,              null: false
      t.string        :building
      t.string        :phone_number,      null: false
      t.references    :buy_record,        foreign_key: true 
    end
  end
end
