class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name
      t.integer :answer_id

      t.timestamps null: false
    end
    add_index :choices, :answer_id
  end
end
