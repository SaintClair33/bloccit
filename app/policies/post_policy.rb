class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.present?
        scope.where(user: user)
      else
        scope.none
      end
    end

  end

  def index? # Overrides the false setting in Application_policy file. inheriting classes can overwrite
    #methods in parents class
    false
  end
end

