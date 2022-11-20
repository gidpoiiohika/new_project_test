class AddCommentableToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_type, :string, null: false
    add_column :comments, :commentable_id, :bigint, null: false
    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end
end
