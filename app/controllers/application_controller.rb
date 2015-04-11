class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, #:posts_controller?, :flash_attack,
    if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end

    #def posts_controller?
      #controller_name == "posts"
    #end

    #def flash_attack
        #flash[:notice] = "This flash should work."
    #end
end
