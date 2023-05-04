class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_profiles
    create_table :user_profiles do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :birthDate
      t.string :location
      t.string :gender
      t.string :profile_pic
      t.string :occupation
      t.string :source_ip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
