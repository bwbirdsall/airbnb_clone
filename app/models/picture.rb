class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_attached_file :image, :styles => {:large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :path => ":rails_root/public/system/#{Rails.env}/:id/:style/:basename.:extension", :url => "/system/#{Rails.env}/:id/:style/:basename.:extension", :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
