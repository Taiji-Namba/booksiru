class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :genre
      t.string :booksgenreid
      t.timestamps
    end
  end
end
