class AddRatingToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :rating, :bigint, null: false, default: 0
    add_index :comments, :rating
  end
end
