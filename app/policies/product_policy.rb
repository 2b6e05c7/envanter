class ProductPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def filtered?
    user.admin?
  end

  def confirmation_operations?
    user.admin?
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
