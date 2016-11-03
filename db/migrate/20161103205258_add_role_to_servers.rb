class AddRoleToServers < ActiveRecord::Migration[5.0]
  def change
    add_column :servers, :role, :integer, default: 0
  end
end
