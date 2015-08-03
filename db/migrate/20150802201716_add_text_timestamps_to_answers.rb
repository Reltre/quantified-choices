class AddTextTimestampsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :description, :text
    add_column :answers, :create_at, :datetime
    add_column :answers, :updated_at, :datetime
  end
end
