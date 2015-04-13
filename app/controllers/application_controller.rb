class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, :flash_attack,


    if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end
    


    #def posts_controller?
      #controller_name == 'posts'
      #flash[:notice] = "This better work."
    #end
    def flash_attack
      if controller_name == 'posts'
      flash[:notice] = "This better work."
    end
  end






end

