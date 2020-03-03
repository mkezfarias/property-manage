class Property < ApplicationRecord
  belongs_to :user
  validates :type, :title, :address, :map, :pictures, presence: true
end
