class Appointment < ApplicationRecord
  belongs_to :property
  belongs_to :tenant, class_name: 'User'
  belongs_to :rep, class_name: 'User'
end
