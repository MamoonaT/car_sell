class AdStepsController < ApplicationController
	include Wicked::Wizard
	steps :picture, :contact

	def show
		@ad = Ad.new
		render_wizard 	
	end
end
