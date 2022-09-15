class FavouritesController < ApplicationController
  
  def index
  end

  def update
    favourite = Favourite.where(ad: Ad.find(params[:ad]), user: current_user)
      if favourite == []
        Favourite.create(ad: Ad.find(params[:ad]), user: current_user)
        @favourite_exists = true
      else
        Favourite.destroy_all
        @favourite_exists = false
      end
      respond_to do |format|
      format.html{}
      format.js{}
      end
  end
end
