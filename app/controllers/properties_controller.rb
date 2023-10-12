class  PropertiesController< ApplicationController
  def index
    render json: Property.all
  end

  def create
    property = Property.new(property_params)

    if property.save
      # Sube la imagen a Cloudinary
      uploaded_file = Cloudinary::Uploader.upload(params[:property][:photo_url])

      # Almacena la URL de la imagen en el objeto Property
      property.photo_url = uploaded_file['secure_url']

      property.save
      render json: property, status: :created
    else
      render json: property.errors, status: :unprocessable_entity
    end
  end

  #private
  def property_params
    params.require(:property).permit(:address, :bedroom, :property_type_id)
  end
end

