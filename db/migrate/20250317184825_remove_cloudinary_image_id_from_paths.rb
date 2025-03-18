class RemoveCloudinaryImageIdFromPaths < ActiveRecord::Migration[7.1]
  def change
    remove_column :paths, :cloudinary_image_id, :string
  end
end
