class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
    	t.string :name, null: false
    	t.references :postcard, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
