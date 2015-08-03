class ApplicationController < ActionController::Base
      include Pundit
  protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, #:posts_controller?, :flash_attack,
    if: :devise_controller?

      rescue_from Pundit::NotAuthorizedError do |exception| #if there is a error creating a post  
        redirect_to root_url, alert: exception.message
      end

    def after_sign_in_path_for(resource)
      topics_path
    end

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
