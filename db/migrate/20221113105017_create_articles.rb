class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title,       null: false, default: "", index: true
      t.string :description, null: false, default: ""
      t.bigint :author_id,   null: false, index: true
      t.integer :status

      t.timestamps
    end
  end
end
