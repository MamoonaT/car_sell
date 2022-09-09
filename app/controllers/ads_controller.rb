class AdsController < ApplicationController

	def index
    @ads = ad.order("created_at DESC")
  end

	def new
		@ad = Ad.new
	end

	def create
		@ad = Ad.new(ad_params)
		if @ad.save
      redirect_to @ad
    else
      render 'ads_path'
    end
	end

	def show
		@ad= Ad.find(params[:id])  
	end

private

	def ad_params
    params.require(:ad).permit(:city, :car_make, :color, :transmission_type, :assembly_type)
  end

end
