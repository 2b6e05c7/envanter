class PanelController < ApplicationController
  before_action :verify_policy
  def index; end

  def users
    @users = User.page(params[:page])
  end

  def user
    return redirect_to users_path unless User.exists?(params[:id])
    @user = User.find(params[:id])
    @debits = Debit.where(user: @user)
  end

  def my_debits
    @debits = current_user.debits.page(params[:page])
  end

  def debits
    @debits = Debit.page(params[:page])
  end

  def logs
    @activities = PublicActivity::Activity.page(params[:page])
  end

  private

  def verify_policy
    authorize self
  end
end
