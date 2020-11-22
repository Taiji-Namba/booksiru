class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :register_book, null: false, foreign_key: true
      t.integer :flag

      t.timestamps
    end
    add_index :notices, [:user_id, :register_book_id], unique: true
  end
end
