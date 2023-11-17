class ClientPolicy < ApplicationPolicy

  def new?
    user.has_role?(:admin)
  end

  def create?
    new?
  end
end
