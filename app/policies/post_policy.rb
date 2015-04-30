class PostPolicy < ApplicationPolicy
    class Scope
      attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all?
      else
        scope.where(:published => true)
      end
    end
  end
  def index? # Overrides the false setting in Application_policy file. inheriting classes can overwrite
    #methods in parents class
    false
  end
end

