Property.destroy_all
PropertyType.destroy_all

house = PropertyType.create(name: "house")
apartment = PropertyType.create(name: "apartment")

property = Property.new(address: "Av. La Cultura, Cusco-Cusco", operation_type: "rent",  bedroom: 3, bathroom: 2, area: 152, active: true, property_type: house)

puts property.errors.full_messages unless property.save

puts "Seeding finished"

