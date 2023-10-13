UserPropertyRent.destroy_all
UserPropertySale.destroy_all
Property.destroy_all
User.destroy_all


cristhian_owner = User.create(name: "Cristhian Owner", email: "cverah_owner@mail.com", password: "123456", phone: "928646027", role: 1)
cristhian_home_seeker = User.create(name: "Cristhian Home", email: "cverah_home@mail.com", password: "123456", phone: "928646027", role: 0)

# propiedad_599= Property.create(address:"Av. las malvinas", property_type:0, operation_type:"sale");
# propiedad_600= Property.create(address:"Av. peru", property_type:1, operation_type:"sale");
# propiedad_601= Property.create(address:"Av. chalhuanca", property_type:1, operation_type:"sale");
# # p propiedad_599.errors.full_messages

# propiedad_sale_599= UserPropertySale.create(user: cristhian_home_seeker,property: propiedad_599);
# propiedad_sale_600= UserPropertySale.create(user: cristhian_owner,property: propiedad_600);
# propiedad_sale_601= UserPropertySale.create(user: cristhian_owner,property: propiedad_601);
# p propiedad_sale_599.errors.full_messages
# p propiedad_sale_600.errors.full_messages
# p propiedad_sale_601.errors.full_messages

#creando simultaneamente primero la propiedad y luego el sale o rent
# Crear un UserPropertySale con new
#sale
propiedad_sale_599 = UserPropertySale.new(user: cristhian_home_seeker)
propiedad_599 = Property.create(address: "Av. las malvinas", property_type: 0, operation_type: "sale", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png")
propiedad_sale_599.property = propiedad_599
propiedad_sale_599.save

propiedad_sale_600 = UserPropertySale.new(user: cristhian_owner)
propiedad_600= Property.create(address:"Av. peru", property_type:1, operation_type:"sale", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png");
propiedad_sale_600.property = propiedad_600
propiedad_sale_600.save

propiedad_sale_601 = UserPropertySale.new(user: cristhian_owner)
propiedad_601= Property.create(address:"Av. chalhuanca", property_type:1, operation_type:"sale", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png");
propiedad_sale_601.property = propiedad_601
propiedad_sale_601.save

#rent
propiedad_rent_602 = UserPropertyRent.new(user: cristhian_home_seeker)
propiedad_602 = Property.create(address: "Av. tamburco", property_type: 0, operation_type: "rent", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png")
propiedad_rent_602.property = propiedad_602
propiedad_rent_602.save

propiedad_rent_603 = UserPropertyRent.new(user: cristhian_owner)
propiedad_603 = Property.create(address: "Av. Maucacalle", property_type: 0, operation_type: "rent", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png")
propiedad_rent_603.property = propiedad_603
propiedad_rent_603.save

propiedad_rent_604 = UserPropertyRent.new(user: cristhian_owner)
propiedad_604 = Property.create(address: "Av. Jesus Maria", property_type: 0, operation_type: "rent", photo_url:"https://res.cloudinary.com/dvxvdktvr/image/upload/v1697046792/d3h7lv5hnyq2ukk0ufyh.png")
propiedad_rent_604.property = propiedad_604
propiedad_rent_604.save

