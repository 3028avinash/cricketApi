class AddColumnToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :roles, :text, Array: true, Default: []
  end
end
