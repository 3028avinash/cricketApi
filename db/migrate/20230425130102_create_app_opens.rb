class CreateAppOpens < ActiveRecord::Migration[7.0]
  def change
    create_table :app_opens do |t|
      t.integer :user_id
      t.string :versionName
      t.string :versionCode
      t.string :location
      t.string :source_ip

      t.timestamps
    end
  end
end
