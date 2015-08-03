class RenameColumForTimestampsAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :create_at, :created_at
  end
end
