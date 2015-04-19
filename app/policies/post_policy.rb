class PostPolicy < ApplicationPolicy
  def index? # Overrides the false setting in Application_policy file. inheriting classes can overwrite
    #methods in parents class
    false
  end
end

