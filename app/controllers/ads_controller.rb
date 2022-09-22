class AdsController < ApplicationController
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  before_action :authorization, only: [:edit, :update, :destroy]

  def index
    @ads = Ad.order(:id).page(params[:page])
  end

  def new
    @ad = Ad.new
  end

  def create
    if @ad.save
      session[:ad_id] = @ad.id
      @ad.update_attributes(ad_params)
      redirect_to ad_steps_path
    else
      render :new
    end
  end

  def edit;  end

  def update
    if @ad.update(ad_params)
      redirect_to ad_path
    else
      render :edit, alert: 'You are not authorized'
    end
  end

  def show
    @favourite_exists = Favourite.where(ad: @ad, user: current_user) != []
  end

  def destroy
    @ad.destroy
    redirect_to ad_path
  end

  private

  def authorization
    authorize @ad
  end

  def find_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:city, :car_make, :color, :transmission_type, :assembly_type, :engine_type, :image,
                               :milage, :engine_type, :primary_contact, :secondary_contact, :price, :add_description)
  end
end
