class ApplicationController < ActionController::Base
	add_flash_types :success, :danger, :info, :warning
	 protect_from_forgery with: :exception
  

  

   
end
