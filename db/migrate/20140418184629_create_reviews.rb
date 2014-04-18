class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :property_id
      t.string :header
      t.text :body

      t.timestamps
    end
  end
end
