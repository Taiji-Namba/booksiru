class CreateAuthorFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :author_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :author_favorites, [:user_id, :author_id], unique: true
  end
end