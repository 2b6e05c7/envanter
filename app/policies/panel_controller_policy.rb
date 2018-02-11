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
    true
  end

  def user?
    true
  end

  def logs?
    user.admin? || user.manager?
  end
end
