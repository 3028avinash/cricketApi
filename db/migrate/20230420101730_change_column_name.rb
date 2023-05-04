class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
      change_table :teams do |t|
        t.rename :countryName, :teamName
        t.rename :countryCode, :teamCode
      end
  end
end
