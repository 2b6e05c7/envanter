class ProductPolicy < ApplicationPolicy
  def index?
    user.admin? || user.coordinator?
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

  def debit_to_user?
    user.admin?
  end

  def debit_to_group?
    user.admin?
  end

  def remove_debit?
    user.admin?
  end

  def cancel_debit_request?
    user.admin?
  end

  private

  def product
    record
  end
end
