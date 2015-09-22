class ReAddChoicesTable < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name
      t.integer :user_id
      t.integer :next_id
      t.integer :previous_id
      
      t.timestamps null: false
    end
  end
end
