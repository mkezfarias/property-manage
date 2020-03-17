class Property < ApplicationRecord
  include AlgoliaSearch
  belongs_to :landlord, class_name: 'User'
  has_one :contract
  has_many :appointments
  has_many :tenants, through: :contract
  # validates :kind_of_property, :title, :address, :map, :pictures, presence: true

  has_many_attached :prop_images

  #algoliasearch do
    # Sending 3 model attributes
  #  attributes :address, :price, :kind_of_property
  end
end