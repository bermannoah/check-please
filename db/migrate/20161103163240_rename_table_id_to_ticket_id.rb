class RenameTableIdToTicketId < ActiveRecord::Migration[5.0]
  def change
    rename_column :ticket_items, :table_id, :ticket_id
  end
end
