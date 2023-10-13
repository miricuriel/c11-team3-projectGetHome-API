User.destroy_all
# Property.destroy_all
# PropertyType.destroy_all

# property = Property.new(address: "Av. La Cultura, Cusco-Cusco", operation_type: "rent",  bedroom: 3, bathroom: 2, area: 152, active: true, property_type: house)

# puts property.errors.full_messages unless property.save

# puts "Seeding finished"
# {
# 	"name": "Cristhian",
# 	"email": "abcde@mail.com",
# 	"password": "123456",
# 	"phone":"928646027",
# 	"role": 1

# }
cristhian_owner = User.create(name: "Cristhian", email: "cverah_owner@mail.com", password: "123456", phone: "928646027", role: 1)
cristhian_home_seeker = User.create(name: "Cristhian", email: "cverah_home@mail.com", password: "123456", phone: "928646027", role: 0)

