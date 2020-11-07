class CreateBooksOfTheAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :books_of_the_authors do |t|
      t.string :isbn
      t.string :title
      t.string :sales_date
      t.string :image_url
      t.string :item_url
      t.string :item_price
      t.string :books_genre_id
      t.string :size
      t.references :author_favorite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
