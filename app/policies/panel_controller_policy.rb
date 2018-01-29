class PanelControllerPolicy
  attr_reader :user, :ctrlr

  def initialize(user, controller)
    @user = user
    @controller = controller
  end

  def index?
    true
  end

  def users?
    user.admin? || user.coordinator?
  end

  def user?
    user.admin? || user.coordinator?
  end

  def my_debits?
    true
  end

  def debits?
    user.admin?
  end

  def confirm_my_debit?
    true
  end

  def confirm_debit_of_my_group?
    user.admin? || user.coordinator?
  end

  def logs?
    user.admin?
  end

  private

  def product
    record
  end
end
