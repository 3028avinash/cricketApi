class RemoveTimestampsFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :created_at, :string
    remove_column :teams, :updated_at, :string
    remove_column :teams, :matchStatus, :string
    remove_column :teams, :views, :string
    remove_column :teams, :news, :string
  end
end
