class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.string :location
      t.references :server, foreign_key: true

      t.timestamps null: false
    end
  end
end
