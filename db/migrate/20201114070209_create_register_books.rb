class CreateRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :register_books do |t|
      t.references :author_favorite, null: false, foreign_key: true
      t.references :favored_author_book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :register_books. [:author_favorite_id, :favored_author_id], unique: true
  end
end
