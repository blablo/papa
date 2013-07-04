class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

=======
>>>>>>> 7782feb29def7f3873a9fe9904f2d6eb91821e91
end
