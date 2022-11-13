class AddCategoryIdToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :category_id, :bigint, null: false
    add_index :articles, :category_id, unique: true
  end
end
