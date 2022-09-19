# frozen_string_literal: true

# homecontroller
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = false
  end

  def new
    @filters = ActiveModel::Type::Boolean.new.cast(params[:filters])
  end

  def search
    @result = PgSearch.multisearch(search_params.values)
  end

  private

  def search_params
    params.require(:ad).permit(:city, :milage, :car_make, :transmission_type, :price, :engine_type, :assembly_type,
                               :engine_capacity, :color)
  end
end
