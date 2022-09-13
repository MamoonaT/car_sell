class FavouritesController < ApplicationController
  def update
    favourite = Favourite.where(ad: Ad.find(params[:ad]), user: current_user)
     if favourite == []
      Favourite.create(ad: ad.find(params[:ad]), user: current_user)
     else
      
     end
  end
end
