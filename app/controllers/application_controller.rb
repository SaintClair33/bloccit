class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, if: :devise_controller?

    before_filter :flash_attack

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end

    #def posts_controller?
      #if controller_name == "posts"
        #flash[:notice] = "This flash should work."
      #end
    #end

    def flash_attack
      if controller_name == "posts"
      flash[:notice] = "This flash should work."
      end
    end
end