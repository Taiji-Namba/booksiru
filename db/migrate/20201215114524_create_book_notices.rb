class CreateBookNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :book_notices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favored_book, null: false, foreign_key: true
      t.integer :notice_flag, default: 0

      t.timestamps
    end
    add_index :book_notices, [:user_id, :favored_book_id], unique: true
  end
end
