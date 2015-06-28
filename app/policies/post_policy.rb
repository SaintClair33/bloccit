class PostPolicy < ApplicationPolicy #Policy for the post class
  def index? # Overrides the false setting in Application_policy file. inheriting classes can overwrite
    #methods in parents class
    true
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end

