class Review<ActiveRecord::Base
  belongs_to :property
  belongs_to :user

  validates :user_id, presence: true
  validates :property_id, presence: true
  validates :header, presence: true
  validates :body, presence: true
end
