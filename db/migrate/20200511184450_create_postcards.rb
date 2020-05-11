class CreatePostcards < ActiveRecord::Migration[6.0]
  def change
    create_table :postcards do |t|
      t.references :city, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.string :image

      t.timestamps
    end
  end
end
