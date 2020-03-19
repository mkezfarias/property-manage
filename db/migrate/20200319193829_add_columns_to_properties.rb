class AddColumnsToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :type, :string
    add_column :properties, :street_name, :string
    add_column :properties, :house_number, :integer
    add_column :properties, :neighborhood, :string
    add_column :properties, :city, :string
    add_column :properties, :municipality, :string
    add_column :properties, :latitude, :decimal
    add_column :properties, :longitude, :decimal
    add_column :properties, :lease, :string
    add_column :properties, :security_deposit, :float
    add_column :properties, :min_lease, :float
    add_column :properties, :verified, :boolean
    add_column :properties, :gated, :boolean
    add_column :properties, :rules, :string, array: true
    add_column :properties, :perks, :string, array: true
    add_column :properties, :close_to, :string, array: true
    add_column :properties, :has_contract, :boolean
    add_column :properties, :visits_count, :integer
  end
end
