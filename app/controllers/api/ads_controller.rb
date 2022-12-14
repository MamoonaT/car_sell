class Api::AdsController < Api::ApplicationController
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @ads = Ad.all.page(params[:page])
  end

  def myads
    @ads = current_user.ads.page(params[:page])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build
    @ad.save(validate: false)
    redirect_to ad_ad_steps_path(@ad)
  end

  def edit; end

  def update
    @ad.update(ad_params)
  end

  def show
    @favourite_exists = Favourite.where(ad: @ad, user: current_user) != []
  end

  def destroy
    @ad.destroy
  end

  private

  def find_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:city, :car_make, :color, :transmission_type, :assembly_type, :engine_type, :image,
                               :milage, :engine_type, :primary_contact, :secondary_contact, :price, :add_description)
  end
end
