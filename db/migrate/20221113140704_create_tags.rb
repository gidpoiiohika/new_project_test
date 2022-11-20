class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, default: "", index: true
      t.belongs_to :article, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
