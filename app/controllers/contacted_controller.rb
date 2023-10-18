class ContactedController < ApplicationController
  def index
    favorites = PropertyUser.select { |fav| fav.contacted == true } 
    contacted = current_user.save_properties.select do |f| 
      favorites.any? { |fa| fa.property_id == f.id }
    end

    render json: contacted
  end
end
