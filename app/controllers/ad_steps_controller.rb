class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :details, :picture, :contact
  before_action :find_ad, only: [:show, :update]

  def show
    render_wizard
  end  
  
  def update
    case step
    when :picture
      @ad.update(detail_params)
    when :contact
      @ad.update(image_params)
    end
    if @ad.update(contact_params)
      render "finish_wizard_path", notice: "Thanks for posting an AD."
    else
      render_wizard
    end
  end

  def finish_wizard_path
    ads_path
  end


  private
  
  def find_ad
    @ad = Ad.find_by(id: params[:ad].present? ? params[:ad][:ad_id] : params[:ad_id])
    @ad = Ad.new if @ad.blank?
  end

  def detail_params
    params.require(:ad).permit(:city, :color, :car_make, :engine_type, :milage, :price, :transmission_type, :engine_capacity, :add_discription, :assembly_type)
  end

  def image_params
    params.require(:ad).permit(image: [])
  end

  def contact_params
    permitted_params = params.require(:ad).permit(:primary_contact, :secondary_contact)
    permitted_params.merge!(user_id: current_user.id)
  end

end

