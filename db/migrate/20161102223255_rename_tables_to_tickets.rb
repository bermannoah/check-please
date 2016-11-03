class RenameTablesToTickets < ActiveRecord::Migration[5.0]
  def change
    rename_table :orders, :tickets
  end
end
