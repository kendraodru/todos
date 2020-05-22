class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :body, null:false
      t.string :author, null:false
      t.integer :user_id, null:false
      
      t.timestamps
    end
  end
end
