class FavouritesController < ApplicationController
  def update
    favourite = Favourite.where(ad: Ad.find(params[:ad]), user: current_user)
    if favourite == []
      Favourite.create(ad: Ad.find(params[:ad]), user: current_user)
      @favourite_exists = true
    else
      favourite.destroy_all
      @favourite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
