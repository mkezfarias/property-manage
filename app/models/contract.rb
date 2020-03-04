class Contract < ApplicationRecord
  validates :property_id, :tenant_id, :landlord_id, presence: true
  belongs_to :property
  belongs_to :landlord, class_name: 'User'
  belongs_to :tenant, class_name: 'User'
end
