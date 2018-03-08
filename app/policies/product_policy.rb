class ProductPolicy < ApplicationPolicy
  def index?
    user.admin? || user.manager?
  end

  def filtered?
    user.admin? || user.manager?
  end

  def confirmation_operations?
    user.admin? || user.manager?
  end

  def show?
    true
  end

  def create?
    user.admin? || user.manager?
  end

  def update?
    user.admin? || user.manager?
  end

  def destroy?
    user.admin? || user.manager?
  end

  def change_status?
    user.admin? || user.manager?
  end

  def confirm?
    user.admin? || user.manager?
  end
end
