class AddCreatedAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, "created_at", :datetime, null: false, default: Time.now
    add_column :orders, "updated_at", :datetime, null: false, default: Time.now
  end
end
