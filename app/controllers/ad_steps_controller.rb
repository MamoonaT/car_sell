class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :details, :picture, :contact
  before_action :find_ad, only: [:show, :update]

  def show
    render_wizard
  end

  def update
    case step
    when :picture then @ad.update(details_params)
    when :contact then @ad.update(image_params) end
    if params[:id] == 'wicked_finish'
      @ad.update(contact_params)
      render 'wicked_finish'
    else
      render_wizard
    end
  end

  def wicked_finish; end

  private

  def find_ad
    @ad = Ad.new if @ad.blank?
    @ad = if ad_id.present?
            Ad.find_by(id: ad_id)
          else
            Ad.new(user_id: current_user.id)
          end
  end

  def ad_id
    params[:ad].present? ? params[:ad][:ad_id] : params[:ad_id]
  end

  def details_params
    params.require(:ad).permit(:city, :color, :car_make, :engine_type, :milage, :price, :transmission_type,
                               :engine_capacity, :add_description, :assembly_type)
  end

  def image_params
    params.require(:ad).permit(images: [])
  end

  def contact_params
    permitted_params = params.require(:ad).permit(:primary_contact, :secondary_contact)
    permitted_params.merge!(user_id: current_user.id)
  end
end
