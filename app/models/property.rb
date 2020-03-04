class Property < ApplicationRecord
  belongs_to :user
  has_one :contract
  
  validates :type, :title, :address, :map, :pictures, presence: true
end
