class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title 
      t.string :author 
      t.string :sales_date
      t.string :availability
      t.string :publisher
      

      t.timestamps
    end
  end
end
