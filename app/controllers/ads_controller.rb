class AdsController < ApplicationController

	def index
    @ads = Ad.order(created_at: :desc)
  end

	def new
		@ad = Ad.new
	end

	def create
		@ad = Ad.new(ad_params)
		if @ad.save	
      redirect_to ad_steps_path
    else
      render 'new'
    end
	end

	def show
		@ad= Ad.find(params[:id])  
	end

private

	def ad_params
    params.require(:ad).permit(:city, :car_make, :color, :transmission_type, :assembly_type, :engine_type, :image, :milage, :engine_type, :primary_contact, :secondary_contact, :price, :add_discription)
  end

end
