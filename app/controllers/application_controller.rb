class ApplicationController < ActionController::Base
	def favourite_text
		return @favourite_exists ? "unfavourite" : "favourite"
	end

	helper_method :favourite_text
end
