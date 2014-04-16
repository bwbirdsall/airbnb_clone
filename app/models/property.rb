class Property < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :name, scope: :location
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price_day, presence: true
  validates :rental_type, presence: true

  monetize :price_day, as: "price_per_day"
  monetize :price_week, as: "price_per_week", allow_nil: true
  monetize :price_month, as: "price_per_month", allow_nil: true


end
