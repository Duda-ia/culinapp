class AddRatingToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :rating, :integer, default: 0
  end
end
