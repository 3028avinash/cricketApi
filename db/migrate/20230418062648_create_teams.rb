class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :countryName
      t.string :countryCode
      t.string :matchStatus
      t.string :views
      t.string :teamLogo
      t.string :news

      t.timestamps
    end
  end
end
