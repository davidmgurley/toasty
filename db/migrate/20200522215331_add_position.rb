class AddPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :position, :text
  end
end
