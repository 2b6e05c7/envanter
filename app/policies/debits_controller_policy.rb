class DebitsControllerPolicy
  attr_reader :user, :controller

  def initialize(user, controller)
    @user = user
    @controller = controller
  end

  def index?
    true
  end

  def my_debits?
    true
  end

  def my_debits_for_print?
    true
  end

  def confirm_my_debit?
    true # Checked in controller and view.
  end

  def confirm_my_group_debit?
    true # Checked in controller and view.
  end

  def request_to_remove_my_debit?
    true # Checked in controller and view.
  end

  def request_to_remove_my_group_debit?
    true # Checked in controller and view.
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
