class ChangePropertyPicturesTypeToArray < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :pictures, "varchar[] USING (string_to_array(pictures, ','))"
  end
end
