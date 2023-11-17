class UserPolicy < ApplicationPolicy
    
  def new?
    user.has_role?(:admin)
  end
  
  def edit?
    new?
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end
end
