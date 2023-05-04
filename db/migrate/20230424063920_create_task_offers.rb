class CreateTaskOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :task_offers do |t|
      t.string :title
      t.string :titleImg
      t.string :tasks, :text, Array: true, Default: []
      t.string :point
      t.string :reward

      t.timestamps
    end
  end
end
