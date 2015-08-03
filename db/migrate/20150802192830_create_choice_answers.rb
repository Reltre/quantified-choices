class CreateChoiceAnswers < ActiveRecord::Migration
  def change
    create_table :choice_answers do |t|
      t.integer :choice_id, :answer_id
      
      t.timestamps null: false
    end
  end
end
