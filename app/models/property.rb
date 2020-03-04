class Property < ApplicationRecord
  belongs_to :landlord, class_name: 'User'
  has_one :contract
  
  validates :type, :title, :address, :map, :pictures, presence: true
end
