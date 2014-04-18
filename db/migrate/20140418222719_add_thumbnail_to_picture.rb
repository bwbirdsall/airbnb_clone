class AddThumbnailToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :thumbnail, :boolean
  end
end
