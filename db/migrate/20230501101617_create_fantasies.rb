class CreateFantasies < ActiveRecord::Migration[7.0]
  def change
    drop_table :fantasies
    create_table :fantasies do |t|
      t.string :title
      t.string :logo
      t.string :link
      t.string :refrelCode
      t.string :signUpBonus
      t.string :Withdraw
      t.string :withdrawType

      t.timestamps
    end
  end
end
