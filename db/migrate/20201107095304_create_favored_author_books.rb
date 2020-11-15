class CreateFavoredAuthorBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :favored_author_books do |t|
      t.string :isbn
      t.string :title
      t.string :sales_date
      t.string :image_url
      t.string :item_url
      t.string :item_price
      t.string :books_genre_id
      t.string :size
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favored_author_books, [:author_id, :isbn], unique: true
  end
end
