class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favored_author_book, null: false, foreign_key: true
      t.integer :notice_flag, default: 0

      t.timestamps
    end
    add_index :notices, [:user_id, :favored_author_book_id], unique: true, name: "notices_index"
  end
end