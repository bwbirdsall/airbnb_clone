class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :location
      t.string :rental_type
      t.decimal :price_day
      t.decimal :price_week
      t.decimal :price_month

      t.timestamps
    end
  end
end
