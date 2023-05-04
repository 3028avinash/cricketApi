class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :logo
      t.string :amount, :text, Array: true, Default: []

      t.timestamps
    end
  end
end
