class CreateTableItems < ActiveRecord::Migration[5.0]
  def change
    create_table :table_items do |t|
      t.references :table, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps null: false
    end
  end
end
