class CreateBookFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :book_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :title_kana, null: false, foreign_key: true

      t.timestamps
    end
    add_index :book_favorites, [:user_id, :title_kana_id], unique: true
  end
end
