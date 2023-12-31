UserPropertyRent.destroy_all
UserPropertySale.destroy_all
Property.destroy_all
User.destroy_all

test_owner = User.create(name: "Test Owner", email: "test_owner@mail.com", password: "123123", role: "owner", phone: "985644456")
test_seeker = User.create(name: "Test HomeSeeker", email: "test_seeker@mail.com", password: "123123", role: "home_seeker", phone: "956231231")

(1..10).each do |i|
  property_type = Faker::Boolean.boolean ? "house" : "apartment"
  number_random = Faker::Number.between(from: 1, to: 5)
  rent = UserPropertyRent.new(user: test_owner)
  sale = UserPropertySale.new(user: test_owner)
 
  rent_photo = []
  sale_photo = []

  2.times do
    search_photos = Unsplash::Photo.search("house")
    random_photo = search_photos.sample
    file = random_photo.urls["regular"]
    rent_photo << file
  end

  2.times do
    search_photos = Unsplash::Photo.search("department")
    random_photo = search_photos.sample
    file = random_photo.urls["regular"]
    sale_photo << file
  end

  # Properties for rent
  property_rent = Property.create(address: Faker::Address.full_address, bedrooms: number_random, bathrooms: number_random, area: Faker::Number.between(from: 50, to: 500), description: Faker::Lorem.paragraph, monthly_rent: Faker::Number.between(from: 500, to: 3000), maintenance: Faker::Number.between(from: 200, to: 500), pets_allowed: Faker::Boolean.boolean, operation_type: "rent", property_type: property_type, photo_url: rent_photo, latitud: Faker::Address.latitude, longitud: Faker::Address.longitude )
  rent.property = property_rent
  rent.save

  # Properties for sale
  property_sale = Property.create(address: Faker::Address.full_address, bedrooms: number_random, bathrooms: number_random, area: Faker::Number.between(from: 50, to: 500), description: Faker::Lorem.paragraph, price: Faker::Number.between(from: 50000, to: 150000), active: Faker::Boolean.boolean, operation_type: "sale", property_type: property_type, photo_url: sale_photo, latitud: Faker::Address.latitude, longitud: Faker::Address.longitude)
  sale.property = property_sale
  sale.save

end



# image_urls = []
# image_paths = ['db/images/lonely_bird.png', 'db/images/lonely_bird.png', 'db/images/lonely_bird.png']

# image_paths.each do |image_path|
#   uploaded_image = Cloudinary::Uploader.upload(image_path)
#   if uploaded_image && uploaded_image['secure_url']
#     image_urls << uploaded_image['secure_url']
#   end
# end



# rent = UserPropertyRent.new(user: test_owner)
# property_rent = Property.create(address: "Av. La Cultura 608", bedrooms: 5, bathrooms: 2, area: 80, description: "Mi primer departamento en la ciudad", monthly_rent: 1300, maintenance: 200, pets_allowed: true, operation_type: "rent", property_type: "apartment") 
# rent.property = property_rent




