class AddColumnsToTaskOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :task_offers, :termsCondition, :string
    add_column :task_offers, :steps, :string
    add_column :task_offers, :link, :string
  end
end
