class AddLandlordIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :landlord_id, :integer, foreign_key: true
  end
end
