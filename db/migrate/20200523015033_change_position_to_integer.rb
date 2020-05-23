class ChangePositionToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :position, 'integer USING CAST(position AS integer)'

  end
end
