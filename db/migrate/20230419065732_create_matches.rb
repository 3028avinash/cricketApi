class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      # t.string :title
      # t.string :shortTitle
      t.string :views
      t.string :matchStatus
      t.string :frontTeam 
      t.string :oppTeam
      
    end
  end
end
