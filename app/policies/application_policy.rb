class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index? #No user can a see a list of resources(ie: when accessing /posts)
    false
  end

  def show?
    scope.where(:id => record.id).exists? # Default rule for showing a records is to ensure it exists
  end

  def create? #for resource creation the default is rule is no access.
    #false
    user.present?
  end

  def new? # for viewing a new acton it is by default keeping the same value as the create.  
    #It calls create.  Keeps it DRY
    create?
  end

  def update?
    #false
    user.present? && (record.user == user || user.admin?) #you have to be a record owner or admin
  end

  def edit?
    update?
  end

  def destroy?
    #false
    update?
  end

  def scope
    #Pundit.policy_scope!(user, record.class)
    record.class # will return the class of the record being authorized.  ie a post instance it will
    #return a post class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

