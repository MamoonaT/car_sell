# frozen_string_literal: true

# homecontroller
class HomeController < ApplicationController
  def index
    @filters = false
  end

  def new
    @filters = ActiveModel::Type::Boolean.new.cast(params[:filters])
  end
end
