class Property < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_many :reviews

  validates_uniqueness_of :name, scope: :location
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price_day, presence: true
  validates :rental_type, presence: true

  monetize :price_day, as: "price_per_day"
  monetize :price_week, as: "price_per_week", allow_nil: true
  monetize :price_month, as: "price_per_month", allow_nil: true

  def self.expensive
    properties = Property.where("price_day >= 50")
  end

  def self.reasonable
    properties = Property.where("price_day < 50 AND price_day > 20")
  end

  def self.cheap
    properties = Property.where("price_day <= 20")
  end

  def thumbnail(picture)
    self.pictures.delete(picture)
    thumb = self.pictures.new(:user_id => self.user_id, :property_id => self.id)
    thumb.image = picture.image
    thumb.save
  end

end

