class Property < ApplicationRecord
  belongs_to :landlord, class_name: 'User'
  has_one :contract
  has_many :appointments
  has_many :tenants, through: :contract
  # validates :kind_of_property, :title, :address, :map, :pictures, presence: true
end
