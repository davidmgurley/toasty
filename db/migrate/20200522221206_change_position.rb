class ChangePosition < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :position, :text

  end
end
