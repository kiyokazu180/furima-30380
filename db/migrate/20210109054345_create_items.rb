class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,             null: false
      t.text    :exoplanation,     null: false
      t.integer :category_id,      null: false
      t.integer :state_id,         null: false
      t.integer :send_fee_id,      null: false
      t.integer :region_id,        null: false
      t.integer :wait_day_id,      null: false
      t.integer :value,            null: false
      t.references :user,          foreign_key: true

      t.timestamps
    end
  end
end
