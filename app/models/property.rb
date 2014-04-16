class Property < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :name, scope: :location
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price_day, presence: true
  validates :rental_type, presence: true


end
