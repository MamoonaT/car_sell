class AdsController < ApplicationController

	def index
    @ads = Ad.order(:id).page(params[:page])
  end

	def new
		@ad = Ad.new
	end

	def create
    @ad = Ad.new(params[:id])
    if @ad.save
      session[:ad_id]= @ad.id
      @ad.update_attributes(ad_params )
      redirect_to ad_steps_path
    else
      render :new
    end
  end

	def show
		@ad= Ad.find(params[:id])  
		@favourite_exists = Favourite.where(ad: @ad, user: current_user) == [] ? false : true
	end

  private

	def ad_params
    params.require(:ad).permit(:city, :car_make, :color, :transmission_type, :assembly_type, :engine_type, :image, :milage, :engine_type, :primary_contact, :secondary_contact, :price, :add_description )
  end

end
