class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :property, foreign_key: true
      t.integer :tenant_id, foreign_key: true
      t.integer :landlord_id, foreign_key: true

      t.timestamps
    end
  end
end
