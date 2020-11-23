class CreateFavoredAuthorBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :favored_author_books do |t|
      t.string :author_name
      t.string :isbn
      t.string :title
      t.string :sales_date
      t.integer :sales_date_integer
      t.string :image_url
      t.string :item_url
      t.string :item_price
      t.string :books_genre_id
      t.string :size

      t.timestamps
    end
    add_index :favored_author_books, :isbn, unique: true
  end
end
