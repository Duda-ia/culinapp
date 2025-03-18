class AddCloudinaryImageIdToPaths < ActiveRecord::Migration[7.1]
  def change
    add_column :paths, :cloudinary_image_id, :string
  end
end
