class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, index: true, null: false
      t.integer :map_x
      t.integer :map_y

      t.timestamps
    end
  end
end
