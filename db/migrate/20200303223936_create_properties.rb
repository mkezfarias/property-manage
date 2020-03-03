class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string  :type
      t.string  :title
      t.string  :address
      t.string  :map
      t.integer :rooms
      t.integer :bathrooms
      t.date    :availability
      t.integer :price
      t.integer :fees
      t.integer :size
      t.integer :parking
      t.boolean :pets
      t.boolean :furnished
      t.text    :description
      t.integer :views
      t.string  :pictures
      t.references :user, foreign_key: true
    end
  end
end
