class CreateRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :register_books do |t|
      t.references :author_favorite, null: false, foreign_key: true
      t.references :favored_author_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
