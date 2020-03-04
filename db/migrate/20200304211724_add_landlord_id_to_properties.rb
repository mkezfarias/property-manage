class AddLandlordIdToProperties < ActiveRecord::Migration[5.2]
  def change
    rename_column :properties, :user_id, :landlord_id
  end
end
