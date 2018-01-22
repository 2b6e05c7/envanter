class ProductPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    return true if user.admin?
  end

  def destroy?
    return true if user.admin?
  end

  def debit_to_user?
    return true if user.admin?
  end

  def debit_to_group?
    return true if user.admin?
  end

  private

  def product
    record
  end
end
