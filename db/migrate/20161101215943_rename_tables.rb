class RenameTables < ActiveRecord::Migration[5.0]
  def change
    rename_table :tables, :tickets
    rename_table :table_items, :ticket_items
  end
end
