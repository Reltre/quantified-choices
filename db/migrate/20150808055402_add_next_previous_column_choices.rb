class AddNextPreviousColumnChoices < ActiveRecord::Migration
  def change
    add_column :choices, :next_id, :integer
    add_column :choices, :previous_id, :integer
  end
end
