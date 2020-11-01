class CreateAuthorFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :author_favorites do |t|
      t.string :author_name, null:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
