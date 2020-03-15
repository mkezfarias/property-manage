class ChangePropertyPicturesTypeToArray < ActiveRecord::Migration[5.2]
  def change
    t.string :properties, :pictures, :string, array: true, default: '{}'
  end
end
