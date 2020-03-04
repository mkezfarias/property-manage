class Property < ApplicationRecord
  belongs_to :landlord, class_name: 'User'
  has_one :contract
  has_many :appointments
  validates :type, :title, :address, :map, :pictures, presence: true
end
