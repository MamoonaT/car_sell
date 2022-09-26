class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps *Ad.form_steps
  before_action :find_ad, only: [:show, :update]

  def show
    @ad = Ad.find(params[:ad_id])
    render_wizard
  end

  def update
    @ad = Ad.find(params[:ad_id])
    @ad.update(ad_params(step))
    render_wizard @ad
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
  
  def ad_params(step)
    permitted_attributes = case step
                           when "details"
                             [:city, :color, :car_make, :engine_type, :milage, :price, :transmission_type,
                              :engine_capacity, :add_description, :assembly_type]
                           when "picture"
                             [images: []]
                           when "contact"
                             [:primary_contact, :secondary_contact]
                           end

    params.require(:ad).permit(permitted_attributes).merge(form_step: step)
    end

end
