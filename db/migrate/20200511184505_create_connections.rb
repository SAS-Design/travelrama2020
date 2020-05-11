class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.references :city, index: true, foreign_key: true, null: false
      t.references :connected_city
      t.integer :cost, null: false

      t.timestamps
    end
  end
end
