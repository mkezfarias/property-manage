require_relative 'spider'
require_relative './../app/models/property'

properties = []

# each iteration adds 50 properties
# 25 houses and 25 flats
(1..5).each do |i|
  properties += scrapper(1, i)
end

p properties.count

properties.each do |property|
 new_property = Property.new
  property.each do |key, val|
    new_property.key = val
  end
  new_property.save
end