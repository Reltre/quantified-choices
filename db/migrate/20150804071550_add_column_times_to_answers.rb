class AddColumnTimesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :times, :integer
  end
end
