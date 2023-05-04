class CreateWithdraws < ActiveRecord::Migration[7.0]
  def change
    create_table :withdraws do |t|
      
      t.integer :account_id
      t.integer :reward_id
      t.integer :coin
      t.string :txn_id
      t.integer :coin_amount

      t.timestamps
    end
  end
end
