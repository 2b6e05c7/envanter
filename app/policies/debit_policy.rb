class DebitPolicy < ApplicationPolicy
  def index?
    !user.staff?
  end

  def my_debits?
    true
  end

  def my_debits_for_print?
    true
  end

  def confirm_my_debit?
    record.user == user
  end

  def confirm_my_group_debit?
    record.group.coordinator == user
  end

  def request_to_remove_my_debit?
    record.user == user
  end

  def request_to_remove_my_group_debit?
    record.group.coordinator == user
  end

  def request_debit?
    user.admin? || user.responsible?
  end

  def confirm_to_remove_debit?
    user.admin? || user.responsible?
  end

  def cancel_debit_request?
    user.admin? || user.responsible?
  end
end
