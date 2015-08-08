class RemoveColumnFromChoices < ActiveRecord::Migration
  def change
    remove_column :choices, :answer_id
  end
end
