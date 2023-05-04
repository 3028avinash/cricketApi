class CreateEarns < ActiveRecord::Migration[7.0]
  def change

    create_table :earns do |t|
      t.integer :account_id
      t.integer :reward_id
      t.string :logo
      t.string :name
      t.integer :coin

      t.timestamps
    end
  end
end
