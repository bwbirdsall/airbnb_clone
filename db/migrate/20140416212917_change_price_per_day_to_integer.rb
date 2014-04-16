class ChangePricePerDayToInteger < ActiveRecord::Migration
  def change
    change_column :properties, :price_day, :integer
  end
end
