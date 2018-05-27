class ResourcePolicy < ApplicationPolicy
  # everyone can see any resource
  def show?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end
end
