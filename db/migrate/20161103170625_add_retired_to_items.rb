class AddRetiredToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :retired, :string, default: "N"
  end
end
