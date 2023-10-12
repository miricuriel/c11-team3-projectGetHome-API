
# Importa la gema cloudinary
require 'cloudinary'

Property.destroy_all
PropertyType.destroy_all



# Carga tus credenciales desde el archivo de configuración cloudinary.yml
Cloudinary.config do |config|
  config.cloud_name = "dvxvdktvr"
  config.api_key = "421427415646992"
  config.api_secret =  "EtceTvaTBv7keUTHCuhXWrm6nHA"
end

house = PropertyType.create(name:"house");

# # Carga una imagen a Cloudinary
uploaded_image = Cloudinary::Uploader.upload('db/images/lonely_bird.png')

# # Crea un nuevo producto y asigna la URL de la imagen al atributo `photo`
prop1 = Property.create(
  address: 'LIMA PERU',
  bedroom: 1,
  photo_url: uploaded_image['secure_url'],
  property_type:house,
)


prop2 = Property.create(
  address: 'LIMA PERU2',
  bedroom: 1,
  photo_url: "db/re/img",
  property_type:house,
)

