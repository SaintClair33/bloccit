class PostPolicy < ApplicationPolicy #Policy for the post class
  def index? # Overrides the false setting in Application_policy file. inheriting classes can overwrite
    #methods in parents class
    true
  end
end

