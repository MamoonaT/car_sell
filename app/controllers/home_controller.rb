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
  
end
