class DropTicketsAndTicketTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :ticket_items
    drop_table :tickets

    create_table :orders do |t|
      t.integer :server_id, index: true
      t.float :total
      t.boolean :paid?
    end

    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
    end
  end
end
