class CreateTitleKanas < ActiveRecord::Migration[6.0]
  def change
    create_table :title_kanas do |t|
      t.string :title_kana, null: false

      t.timestamps
    end
  end
end