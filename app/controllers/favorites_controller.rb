class FavoritesController < ApplicationController
  def index 
    favorites = PropertyUser.select { |fav| fav.favorite == true } 
    fav = current_user.save_properties.select do |f| 
      favorites.any? { |fa| fa.property_id == f.id }
    end
    
      render json: fav
  end
end
