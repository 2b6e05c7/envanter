class ProductPolicy < ApplicationPolicy
  def index?
    user.admin? || user.manager? || user.responsible?
  end

  def filtered?
    user.admin? || user.manager? || user.responsible?
  end

  def confirmation_operations?
    user.admin? || user.manager?
  end

  def show?
    true
  end

  def create?
    user.admin? || user.responsible?
  end

  def update?
    user.admin? || user.responsible?
  end

  def destroy?
    user.admin? || user.responsible?
  end

  def change_status?
    user.admin? || user.responsible?
  end

  def confirm?
    user.admin? || user.manager?
  end
end
