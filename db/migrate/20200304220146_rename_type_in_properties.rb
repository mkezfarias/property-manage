class RenameTypeInProperties < ActiveRecord::Migration[5.2]
  def change
    rename_column :properties, :type, :kind_of_property
  end
end
