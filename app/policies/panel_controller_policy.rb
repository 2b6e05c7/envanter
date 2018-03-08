class PanelControllerPolicy
  attr_reader :user, :controller

  def initialize(user, controller)
    @user = user
    @controller = controller
  end

  def index?
    true
  end

  def users?
    user.admin? || user.manager?
  end

  def user?
    user.admin? || user.manager?
  end

  def change_user_role?
    user.admin?
  end

  def logs?
    user.admin? || user.manager?
  end
end
