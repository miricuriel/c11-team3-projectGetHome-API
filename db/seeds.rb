UserPropertySale.destroy_all
Property.destroy_all
User.destroy_all

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
cristhian_owner = User.create(name: "Cristhian Owner", email: "cverah_owner@mail.com", password: "123456", phone: "928646027", role: 1)
cristhian_home_seeker = User.create(name: "Cristhian Home", email: "cverah_home@mail.com", password: "123456", phone: "928646027", role: 0)

# t.string "operation_type"
# t.string "address"
# t.string "property_type"
# t.integer "bedroom"
# t.integer "bathroom"
# t.integer "area"
# t.text "description"
# t.string "photo_url"
# t.boolean "active"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false

propiedad_599= Property.create(address:"Av. las malvinas", property_type:0, operation_type:"sale");
propiedad_600= Property.create(address:"Av. peru", property_type:1, operation_type:"sale");
propiedad_601= Property.create(address:"Av. chalhuanca", property_type:1, operation_type:"sale");
# p propiedad_599.errors.full_messages

# t.bigint "user_id", null: false
# t.bigint "property_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["property_id"], name: "index_user_property_sales_on_property_id"
# t.index ["user_id"], name: "index_user_property_sales_on_user_id"

propiedad_sale_599= UserPropertySale.create(user: cristhian_home_seeker,property: propiedad_599);
propiedad_sale_600= UserPropertySale.create(user: cristhian_owner,property: propiedad_600);
propiedad_sale_601= UserPropertySale.create(user: cristhian_owner,property: propiedad_601);
p propiedad_sale_599.errors.full_messages
p propiedad_sale_600.errors.full_messages
p propiedad_sale_601.errors.full_messages