class CreatePlayEarns < ActiveRecord::Migration[7.0]
  def change
    create_table :play_earns do |t|
      t.string :title
      t.string :blogImage
      t.string :blogUrl

      # t.timestamps
    end
  end
end
