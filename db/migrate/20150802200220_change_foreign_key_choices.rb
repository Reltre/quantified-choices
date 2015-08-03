class ChangeForeignKeyChoices < ActiveRecord::Migration
  def change
    rename_column :choices, :answer_id, :user_id
  end
end
