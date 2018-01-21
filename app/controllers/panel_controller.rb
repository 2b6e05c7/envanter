# Admin Panel Controller
class PanelController < ApplicationController
  def index; end

  def users
    @users = User.page(params[:page])
  end

  def user
    return redirect_to users_path unless User.exists?(params[:id])
    @user = User.find(params[:id])
    @debits = Debit.where(user: @user)
  end

  def debits
    @debits = Debit.page(params[:page])
  end

  def logs
    @activities = PublicActivity::Activity.page(params[:page])
  end
end
