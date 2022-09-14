class FavouritesController < ApplicationController
  def update
    favourite = Favourite.where(ad: Ad.find(params[:ad]), user: current_user)
     if favourite == []
      Favourite.create(ad: ad.find(params[:ad]), user: current_user)
      @favourite.exists = true
     else
      Favourite.destroy_all
      @favourite.exists = false
     end
     respond_to do |format|
      format.html{}
      format.js{}
  end
end
