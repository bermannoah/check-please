class RenameTables < ActiveRecord::Migration[5.0]
  def change
      rename_table :tables, :orders
  end
end
