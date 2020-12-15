class CreateFavoredBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :favored_books do |t|

      t.timestamps
    end
  end
end
